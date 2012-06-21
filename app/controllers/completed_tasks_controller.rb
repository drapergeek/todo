class CompletedTasksController < ApplicationController
  def create
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    flash[:notice] = "Completed task"
    redirect_to tasks_path
  end
end
