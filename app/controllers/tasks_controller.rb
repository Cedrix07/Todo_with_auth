class TasksController < ApplicationController

  # checks if user is authenticated to access the page
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :find_user 

  def index
    @user = User.find(params[:user_id]) if params[:user_id]
    @tasks = @user.tasks.all if @user
  end 

  def show
    # before_action handles the fetching of the task
  end

  def new
    @task = Task.new({:user_id => @user.id})
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to tasks_path, {:user_id => @user.id}
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

      def find_user 
        if params[:user_id]
          @user = User.find(params[:user_id])
        end 
      end
end
