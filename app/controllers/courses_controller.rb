class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :show, :destroy]
  before_filter :authorize

  def index
    @courses = Course.all.reverse
  end

  def  new
  @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    if @course.destroy
      redirect_to courses_path
    end
  end

  private
  def course_params
    params.require(:course).permit(:title, :day_night)
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
