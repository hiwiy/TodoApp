class TasksController < ApplicationController
before_action :authenticate_user!

def index
    @tasks = Task.paginate page: params[:page], per_page: 5
  end 
def show
    @task = current_user.tasks.find(params[:id])
  end 
def new
   @task= Task.new
 end

def edit
  @task = current_user.tasks.find(params[:id])
end
 
 def create
  @task = current_user.tasks.new(task_params)

  if @task.save
  redirect_to tasks_path, notice: "sucessfully created" 
  end
end
 def update
 @task = current_user.tasks.find(params[:id])
    
   if @task.update(task_params)
    redirect_to @task, notice: "sucessfully updated" 
   end
 end

def destroy
    @task = Task.find(params[:id])
    @task.destroy
 
    redirect_to tasks_path()
  end


private
  def task_params
    params.require(:task).permit(:name, :status)
  end
end
