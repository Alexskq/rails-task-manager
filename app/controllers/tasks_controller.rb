class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to list_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to list_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to restaurants_path, status: :see_other

  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
