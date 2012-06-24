class TasksController < ApplicationController
  expose(:task)
  expose(:tasks)
  respond_to :json

  def index
    respond_with tasks
  end
  def new
    respond_with task
  end
  def edit
    respond_with task
  end
  def show
    respond_with task
  end

  def create
    if task.save
      respond_with task
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end
  def update
    if task.save
      respond_with task
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end
  def destroy
    task.destroy
    head :no_content
  end
end
