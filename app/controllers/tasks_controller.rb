class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @id = Task.find(params[:id])
  end

  def new
    @new = Task.new
  end

  def edit
    @ids = Task.find(params[:id])
  end

  def create
    @new_tasks = Task.new(tasks_params)
    @new_tasks.save
    redirect_to tasks_path
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(tasks_params)
    redirect_to tasks_path
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
