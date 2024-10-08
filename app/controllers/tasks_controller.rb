class TasksController < ApplicationController
  # Ensure the user is authenticated to access these actions
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  

  def index
    @tasks = current_user.tasks
  end 

  def show
    # before_action handles fetching of the task
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)  # Associate task with the current_user
    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    # before_action handles fetching of the task
  end

  def update
    # before_action handles fetching of the task
    if @task.update(task_params)
      flash[:notice] = "Task was successfully updated."
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy 
    @task.destroy
    flash[:warning] = "#{@task.name} was successfully deleted."
    redirect_to tasks_path
  end

  private
    def task_params 
      params.require(:task).permit(:name, :description, :due_date)
    end

    # Finds a task by its id from the params hash
    def set_task
      @task = current_user.tasks.find(params[:id])  
    end
end
