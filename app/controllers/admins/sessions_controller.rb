class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new
    super
  end
  
  def create
    super
  end
  
  def destroy
    super
  end
  
  def after_sign_in_path_for(resource)
    admins_products_path
  end
  
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
  
end
