class GroupTasksController < ApplicationController
 before_action :authenticate_user!

def index
    @group_tasks = GroupTask.all
  end 
def show
    @group_task = GroupTask.find(params[:id])
  end 
def new
    @group_task= GroupTask.new
 end

def edit
   @group_task = GroupTask.find(params[:id])
end
 
 def create
   @group_task = current_user.group_tasks.new(task_params)

  @group_task.save
  redirect_to group_tasks_path, notice: "sucessfully created" 

end
 def update
  @group_task = GroupTask.find(params[:id])
    
   if  @group_task.update(task_params)
    redirect_to  @group_task, notice: "sucessfully updated" 
   end
 end

def destroy
    @group_task  = current_user.group_task.find(params[:id])
    @group_task.destroy
 
    redirect_to group_tasks_path()
  end


private
  def task_params
    params.require(:group_task).permit(:title,:body,:pincharge, :status)
  end
end
