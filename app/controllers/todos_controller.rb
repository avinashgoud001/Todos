class TodosController < ApplicationController
	 before_action :validate_user

     before_action :load_task, only: [:show, :edit, :update, :destroy]


	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		Task.create(task_params)
		redirect_to todos_path
	end

	def show
	end

	def edit
	end

	def update
		@task.update_attributes(task_params)
		redirect_to todos_path
	end

	def destroy
		@task.destroy
		redirect_to todos_path
	end

	private

	def load_task
		@task = Task.find_by_id(params[:id])
	end

def validate_user
  	if session[:user_id].nil?
  	  redirect_to root_url, :notice =>"Please login to view tasks."
  	end
  end


	def task_params
		params.require(:task).permit(:title, :note)
	end
end
