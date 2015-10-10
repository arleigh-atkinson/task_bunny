class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def profile
    @user = current_user
    @requested_tasks = @user.tasks
    @claimed_tasks = Task.where(assigned_user_id: current_user.id)
  end
  
end
