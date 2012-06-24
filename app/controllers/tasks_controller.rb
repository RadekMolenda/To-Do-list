class TasksController < ApplicationController
  respond_to :json

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
    respond_with Task.create(params[:task])
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
