class CoursesController < ApplicationController

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

  def edit
  end

  private
  def course_params
    params.require(:course).permit(:title, :night_day)
  end

end
