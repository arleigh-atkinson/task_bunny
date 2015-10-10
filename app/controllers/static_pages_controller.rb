class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def profile
    @requested_tasks = @user.tasks
    @claimed_tasks = Task.where(assigned_user_id: current_user.id)
  end
  
end
