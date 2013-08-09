class UsersController < ApplicationController
  before_filter :authenticate_user!

  # display feedback page
  def feedback
    @message = ""
  end

  def calendars
    @calendars = Calendar.all
  end

  # receive post and email that feedback
  def send_feedback
    @message = params[:message]
    @subject = params[:subject]
    if Staff.feedback_email(current_user, @subject, @message).deliver
      redirect_to root_path, notice: t("flash.feedback_sent")
    else
      render action: "feedback", alert: t("flash.feedback_failed")
    end
  end

  # page to allow user changing password
  def change_password
    @user = current_user
  end

  # effectively change password
  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path, notice: t("flash.password_changed")
    else
      flash[:alert] = t("flash.password_change_failed")
      render "change_password"
    end
  end
end
