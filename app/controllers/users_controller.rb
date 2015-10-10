class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @requested_tasks = @user.tasks
    @claimed_tasks = Task.where(assigned_user_id: current_user.id)
  end
end
