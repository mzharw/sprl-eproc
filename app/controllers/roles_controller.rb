class RolesController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_role, only: %i[edit update show]

  def index
    @roles = selectable(Role)
    @roles = filter(@roles)
    @roles = paginate(@roles)

    authorize @roles

    respond_to do |format|
      format.html { render 'users/roles/index' }
    end
  end

  def show
    respond_to do |format|
      format.html { render 'users/roles/show' }
    end
  end

  def edit
    respond_to do |format|
      format.html { render 'users/roles/edit' }
    end
  end

  def update
    respond_to do |format|
      if @role.update({ **role_params, **tracker(:update) })
        format.html { redirect_to edit_role_url(@role), notice: 'Role was successfully updated.' }
      else
        format.html { render 'users/roles/edit', status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @role = Role.new
    respond_to do |format|
      format.html { render 'users/roles/new' }
    end
  end

  def create
    @role = Role.new({ **role_params, **tracker })
    respond_to do |format|
      if @role.save
        format.html { redirect_to edit_role_url(@role), notice: 'Role was successfully updated.' }
      else
        format.html { render 'users/roles/new', status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end
end

def set_role
  @role = Role.find(params[:id])
  authorize @role
end

def role_params
  params.require(:role).permit(:name, :state)
end
