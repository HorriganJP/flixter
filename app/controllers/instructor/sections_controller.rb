class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:new, :create]

  def new
    @section = Section.new
  end

  def create
    @section = current_course.sections.create(section_params)
    redirect_to instructor_course_path(current_course)
  end

  def show
  end

  def update
    current_course.update_attributes(section_params)
    render plain: 'Updated!'
  end

  private

  def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: 'Unauthorized', status: :Unauthorized
    end
  end

  helper_method :current_course
  def current_course
    if params[:course_id]
      @current_course ||= Course.find(params[:course_id])
    else
      current_section.course
    end
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def section_params
    params.require(:section).permit(:title, :row_order_postion)
  end
end
