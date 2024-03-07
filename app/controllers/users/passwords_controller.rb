# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    User.find(username: params[:user][:username])

    respond_to do |format|
      format.turbo_stream do
        flash.now[:notice] = 'Successfully sent instructions'
        render turbo_stream: [
          turbo_stream.append('toasts', partial: 'shared/toast'),
        ]
      end
    end
    # super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # protected
  #
  # def find_resource(mapping, user = nil)
  #   if resource_params.present? && resource_params[:username].present?
  #     user = mapping.to.find_by(username: resource_params[:username])
  #   end
  #
  #   user || super
  # end

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

end
