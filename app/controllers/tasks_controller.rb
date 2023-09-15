class TasksController < ApplicationController


	  before_action  :authenticate_user!
	  before_action :set_project
      before_action :set_task, only:[:show,:edit,:update,:destroy]

	def index
    	@tasks = @project.tasks
	end 


	def new 
		@task = @project.tasks.build
	end 


	def create 
		@task = @project.tasks.build(task_params)
		if @task.save
		# redirect_to project_tasks_path
		redirect_to([@task.project])
	else
		render :new
	end 
end


	def show
	end 

	def edit
	end 

	def update 
		if @task.update(task_params)

        redirect_to  ([@task.project])
    else 
    	render :edit

	end 
end
	def destroy
		@task.destroy
		redirect_to([@task.project])
	end 

	 private 
	 def task_params
	 	params.require(:task).permit(:name,:description,:status, :project_id)
	 end

	def set_project
		@project = Project.where(id:params[:project_id]).first
	end


	def set_task
   @task = @project.tasks.where(id:params[:id]).first
	end


	

end







