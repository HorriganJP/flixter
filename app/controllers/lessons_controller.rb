class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson


  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_authorized_for_current_lesson
    if current_lesson.section.course != current_user.enrolled_in?
      redirect_to course_path(current_course)
      flash[:alert] = "You Must Be Enrolled First"
    end
  end

end
