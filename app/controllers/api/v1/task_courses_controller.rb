class Api::V1::TaskCoursesController < Api::Base
  before_action :set_task_course, only: [:update, :destroy]
  # protect_from_forgery except: [:create, :update, :destroy]

  def create
    task_course = TaskCourse.new(task_course_params)
    if task_course.save
      render json: { status: '200', message: 'Created the task_course', data: task_course }
    else
      response_bad_request
    end
  end

  def update
    if @task_course.update(task_course_params)
      render json: { status: '200', message:"Updated the task_course", data: @task_course }
    else
      response_bad_request
    end
  end

  def destroy
    @task_course.destroy
    render json: { status: '200', message:"Deleted the task_course", data: @task_course }
  end
end

  private

  def task_course_params
    params.require(:task_course).permit(:title, :description, :course_time, :calendar_id, :charge )
  end

  def set_task_course
    @task_course = TaskCourse.find(params[:id])
  end