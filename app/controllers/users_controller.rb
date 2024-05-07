class UsersController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_user, only: %i[edit update show change_password]

  def index
    @users = selectable(User.joins(party: :personnel).eager_load(party: :personnel).distinct)
    @users = filter(@users, { full_name: 'parties.full_name', position_name: 'personnels.position_name' }, 'personnels.created_at', :desc)
    json = paginate_json(@users.left_joins(party: :buyer).where(buyers: { id: nil }), :id, :party_id, 'parties.full_name as full_name')
    @users = paginate(@users).decorate

    authorize @users.object

    respond_to do |format|
      format.html { render 'users/personnels/index' }
      format.json { render json: }
    end
  end

  def change_password
    if request.post?
      if policy(current_user).edit? || @user.valid_password?(params[:password])
        new_password = params[:new_password]
        new_password_confirmation = params[:new_password_confirmation]
        if !new_password.empty? && !new_password_confirmation.empty? && new_password == new_password_confirmation

          if new_password.length >= 6
            password = params[:new_password]
            @user.update({ password: })
            flash.notice = 'Successfully changed password.'
            return redirect_to policy(current_user).edit? ? edit_user_path : root_path
          else
            flash.alert = 'Password is too short (minimum is 6 characters).'
          end
        else
          flash.alert = 'New password are mismatched.'
        end
      else
        flash.alert = 'Password are incorrect.'
      end
      redirect_to change_password_user_path
    end
  end

  def show
    respond_to do |format|
      format.html { render 'users/personnels/show' }
    end
  end

  def edit
    respond_to do |format|
      format.html { render 'users/personnels/edit' }
    end
  end

  def update
    respond_to do |format|
      if @user.update({ **user_params, **tracker(:update) })
        user_roles = Role.user_role
        user_roles_ids = user_roles.ids

        existing_roles = user_roles_ids & @user.roles.ids
        modified_roles = user_roles_params[:role_ids] || []

        ids_to_remove = existing_roles - modified_roles
        ids_to_add = modified_roles - existing_roles

        roles_to_remove = user_roles.where(id: ids_to_remove).pluck(:name)
        roles_to_add = user_roles.where(id: ids_to_add).pluck(:name)

        unless roles_to_remove.empty?
          roles_to_remove.each do |role|
            @user.remove_role(role)
          end
        end

        unless roles_to_add.empty?
          roles_to_add.each do |role|
            @user.add_role(role)
          end
        end

        @user.party.update({ **party_params, **tracker(:update) })
        @user.personnel.update({ **personnel_params, **tracker(:update) })
        format.html { redirect_to edit_user_url(@user), notice: 'User was successfully updated.' }
      else
        format.html { render 'users/personnels/edit', status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html { render 'users/personnels/new' }
    end
  end

  def create
    # personnel = Personnel.where('position_name LIKE ?', "%#{personnel_params[:position_name]}%").first
    # party = personnel.present? ? personnel.party : Party.create({ **party_params, **tracker })
    # Personnel.create({ party_id: party.id, **personnel_params, **tracker }) unless personnel.present?
    party = Party.create({ **party_params, **tracker })
    Personnel.create({ party_id: party.id, **personnel_params, **tracker })

    @user = User.new({ party_id: party.id, **user_params, **tracker, state: 'INACTIVE' })
    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_user_url(@user), notice: 'User was successfully updated.' }
      else
        format.html { render 'users/personnels/new', status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end

def set_user
  @user = UserDecorator.new(User.find(params[:id]))
  authorize @user.object
end

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation, :state)
end

def user_roles_params
  params.require(:user).permit(role_ids: [])
end

def party_params
  params.require(:user).permit(:full_name)
end

def personnel_params
  params.require(:user).permit(:position_name)
end

