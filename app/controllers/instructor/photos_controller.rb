class Instructor::PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.new
  end

  def create
    @course = Course.find(params[:course_id])
    @course.photos.create(photo_params.merge(user: current_user))
  end

  private

  def photo_params
    params.require(:photo)
  end

end
