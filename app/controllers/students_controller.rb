class StudentsController < ApplicationController
  before_filter :authenticate_student_user!

  # display resume
  def resume
    @resume = current_user.resume || Resume.new
    if @resume.nil?
      @url = { action: "create_resume" }
    else
      @url = { action: "update_resume" }
    end
  end

  # recive a post and create that resume
  def create_resume
    @url = { action: "create_resume" }
    @resume = current_user.create_resume
    if @resume.update_attributes(params[:resume])
      redirect_to({ action: "resume" }, notice: t("flash.resume_created"))
    else
      flash[:notice] = t("flash.resume_updated")
      render action: "resume"
    end
  end

  # recive a put and update a resume
  def update_resume
    @resume = current_user.resume
    @url = { action: "update_resume" }
    #@resume.assign_attributes(params[:resume])
    #if @resume.valid?
    if @resume.update_attributes(params[:resume])
      redirect_to({ action: "resume" }, notice: t("flash.resume_updated"))
    else
      flash[:notice] = t("flash.resume_updated")
      render action: "resume"
    end
  end

  # display hints
  def hints
    @hints = Hint.all_published
  end
end
