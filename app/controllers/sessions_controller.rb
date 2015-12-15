class SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  def create
    if User.find_by(email: params[:user][:email])
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      respond_to do |format|
        format.js { render action: 'login' }
      end
    else
      build_resource(sign_up_params)
      resource.save
      if resource.persisted?
        if resource.active_for_authentication?
          sign_in(resource_name, resource)
          redirect_to root_path
        else
          expire_data_after_sign_in!
          redirect_to root_path
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_to do |format|
          @error = "Пароль не может быть меньше 8 символов"
          format.js { render action: 'login'}
        end
        end
    end
  end

  private
  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
end