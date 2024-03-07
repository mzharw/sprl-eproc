class UsersController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_user, only: %i[edit update show change_password]

  def index
    @users = selectable(User.joins(party: :personnel).eager_load(party: :personnel).distinct)
    @users = filter(@users, { full_name: 'parties.full_name', position_name: 'personnels.position_name' })
    @users = paginate(@users).decorate

    authorize @users.object

    respond_to do |format|
      format.html { render 'users/personnels/index' }
    end
  end

  def change_password
    if request.post?
      if @user.valid_password? params[:password]
        new_password = params[:new_password]
        new_password_confirmation = params[:new_password_confirmation]
        if !new_password.empty? && !new_password_confirmation.empty? && new_password == new_password_confirmation
          password = params[:new_password]
          @user.update({ password: })
          flash.notice = 'Successfully changed password.'
          return redirect_to root_path
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
        @user.roles.clear
        roles = user_roles_params[:role_ids]
        roles = Role.where(id: roles)
        unless roles.empty?
          roles.each do |role|
            @user.add_role(role.name)
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

