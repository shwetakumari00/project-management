class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates :name, presence: true 
  validates :description, presence: true


	enum status: { 
		active: 0, 
		inactive: 1, 
		deleted: 2
	}
	
	def color 
		case status
			when 'complete'
				'success'
			when 'not-started'
				'warning'
		end 
	end 

	def badge_color
		case state
		when 'complete'
			'success'
		when 'not-started'
			'secondary'
		when 'in-progress'
			'info'
		end
	end

	def state
		
		return 'not-started' if tasks.none?
		if tasks.all? {|task| task.complete?}
			'complete'
		elsif tasks.any?{|task| task.in_progress?}
			'in-progress'
		else 
			'not-started'
		end 
	end 

	def percent_complete
		return 0 if tasks.none? 
		complete_tasks = tasks.select {|task| task.complete?}.count 
		((complete_tasks.to_f / tasks.count)*100).round
	end
	

	def task_complete
		tasks.select {|task| task.complete?}.count 
		
	end

	def total_task
		tasks.count	
	end

	def state_color(project)	
		case project
			when "complete" 
				 "success"
			when "not-started"
				"primary"
			when "in-progress"
				"danger"
		end
	end


end
