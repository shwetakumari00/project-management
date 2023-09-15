class ProjectsController < ApplicationController
   
    before_action  :authenticate_user! 
	before_action :set_project, only:[:show,:edit,:update,:destroy]

	
	def index
    	@projects = current_user.projects 
	end 
        

	def new 
		@project = current_user.projects.build
	end 


	def create 
		@project = current_user.projects.create(project_params)
		if @project.save
			redirect_to  projects_path
		else
			render :new
		end 
  end
  

	def show
		@task = @project.tasks.build 
	end 

	def edit
	end 

	def update 
		if @project.update(project_params)
      redirect_to  projects_path
    else
    	render :edit

	end 
 end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	 private 

	 def project_params
	 params.require(:project).permit(:name, :description)
	end

    def set_project
		@project = current_user.projects.find(params[:id])
	end
   end






