class Api::V1::StoreMemberTasksController < ApplicationController

  def index
    to = Time.current
    from = to.ago(1.years)
    @tasks = Task.joins(:store_member).where(store_members: {id: params[:store_member_id]}).where(start_time: from..to)
                  .order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded Task', data: @tasks }
  end
end
