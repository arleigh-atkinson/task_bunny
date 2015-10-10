class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def assign_task
    @task = Task.find(params[:task_id])
    @task.set_task(current_user)
    redirect_to tasks_path
  end

  def complete_task
    @task = Task.find(params[:task_id])
    @task.mark_task
    redirect_to user_path(current_user)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private
    def find_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :location, :description, :assigned_user_id, :tokens, :image, :user_id, :category, :complete)
    end

end
