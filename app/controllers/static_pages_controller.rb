class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def profile
    @my_tasks = Task.all
    @completed_tasks = Task.all
  end
  
end
