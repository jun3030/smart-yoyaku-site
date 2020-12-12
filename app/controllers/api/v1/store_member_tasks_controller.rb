class Api::V1::StoreMemberTasksController < ActionController::API

  def index
    to = Time.current
    from = to.ago(1.years)
    @tasks = Task.joins(:store_member).where(store_members: {email: params[:store_members_email]})
                  .order(created_at: :desc)
    tasks = task_to_json(@tasks)
    render status: 200, json: { status: "200", message: "Loaded Tasks", tasks: JSON.parse(tasks) }
  end


  private

    def task_to_json(task)
      task.to_json(
        methods: [:start_at, :end_at],
        only: [:id, :request, :start_at, :end_at],
        include: {
          calendar: { :only => [:calendar_name, :calendar_id, :phone] },
          task_course: { :only => [:title, :description, :course_time, :charge] },
          store_member: { :only => [:name, :email, :phone, :address] }
        }
      )
    end
end
