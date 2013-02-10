class UsersController < ApplicationController
  before_filter :authenticate_user!

  # display feedback page
  def feedback
    @message = ""
  end

  # receive post and email that feedback
  def send_feedback
    @message = params[:message]
    if Staff.feedback_email(current_user, @message).deliver
      redirect_to root_path, notice: t("flash.feedback_sent")
    else
      render action: "feedback", alert: t("flash.feedback_failed")
    end
  end
end
