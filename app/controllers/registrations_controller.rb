class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    '/links'
  end

  def after_sign_in_path_for(user)
    links_path
  end
end