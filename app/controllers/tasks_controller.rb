class TasksController < ApplicationController
  def index
    @tasks = Task.completed_first.newest_first
    @task = Task.new
  end
   
  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = "Created task!"
      redirect_to tasks_path
    else
      @tasks = Task.all
      flash[:notice] = "Could not save"
      render 'index'
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
     if @task.update_attributes(params[:task])
        flash[:notice] = "Updated task!"
        redirect_to tasks_path
      else
        flash[:notice] = "Could not save"
        render 'edit'
      end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Deleted task"
    redirect_to tasks_path
  end
end
