class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all 
  end 

  def show
    # before_action handles the fetching of the task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      puts "saved"
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new
    end
  end

  def edit
    # before_action handles the fetching of the task
  end

  def update
    # before_action handles the fetching of the task
    if @task.update(task_params)
      flash[:notice] = "Task was successfully updated."
      redirect_to task_path(@task)
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
        @task = Task.find(params[:id])
      end
end
