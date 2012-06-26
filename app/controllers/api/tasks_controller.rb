class Api::TasksController < Api::BaseController
  def index
    respond_with Task.all
  end
  def show
    respond_with Task.find(params[:id])
  end
  def edit
    respond_with Task.find(params[:id])
  end

  def create
    task = Task.create(params[:task])
    if task.valid?
      respond_with task, location: api_task_path(task)
    else
      respond_with task
    end
  end
  def update
    task = Task.find(params[:id])
    task.update_attributes(params[:task])
    respond_with task
  end
  def destroy
    task = Task.find(params[:id])
    respond_with task.delete
  end
end
