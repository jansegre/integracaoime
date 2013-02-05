class RegistrationsController < Devise::RegistrationsController
  def create
    params[:user][:student] = true
    super
  end
end
