class TasksController < ApplicationController
  before_action :authenticate_user!


  def index
     @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
      @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  private
  def task_params
      params.require(:task).permit(:title, :description, :category, :priority, :complete)
  end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
       
        redirect_to tasks_path
      end

end
