class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]
  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    if @task.update
      redirect_to root_path
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
      params.require(:task).permit(:name, :location, :description, :assigned_user_id, :tokens, :image)
    end
    
end
