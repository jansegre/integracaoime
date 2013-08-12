class RegistrationsController < Devise::RegistrationsController
  def create
    params[:user][:student] = true
    super
    # send welcome email, has to change this when no longer auto accept
    Student.welcome_email(@user).deliver unless @user.invalid?
  end
end
