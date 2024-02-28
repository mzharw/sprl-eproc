class UsersController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_user, only: %i[edit update]

  def index
    query = params[:query] || ''
    @users = User.where('lower(username) LIKE ?', "%#{query.downcase}%")
                 .joins(party: :personnel).eager_load(party: :personnel)
                 .distinct

    @users = filter(@users, { full_name: 'parties.full_name', position_name: 'personnels.position_name' })
    @users = @users.page(params[:page])
                   .decorate
    respond_to do |format|
      format.html { render 'users/personnels/index' }
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
end

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation, :state)
end

def party_params
  params.require(:user).permit(:full_name)
end

def personnel_params
  params.require(:user).permit(:position_name)
end

