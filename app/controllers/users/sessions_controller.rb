# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :require_no_authentication, only: [:new, :create]
  before_action :set_cache_control, only: [:new, :create]

  private

    def require_no_authentication
      if user_signed_in?
        redirect_to tasks_path
      end
    end

    def set_cache_control
      response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'
      response.headers['Pragma'] = 'no-cache'
      response.headers['Expires'] = '0'
    end


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
