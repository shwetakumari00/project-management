class Task < ApplicationRecord
  belongs_to :project


validates :name , presence: true
# validates :description, presence: true
#validates :status, inclusion:{in: ['not-started','in-progress','completed']}
#validates :status , presence: true

   enum status: {
   	'in-progress': 1,
   	'not-started': 2,
   	'complete': 3
   }
  # validates :status, inclusion: {in: ['not-started', 'in-progress','complete']}

	STATUS_OPTION = [
					['Not-started','not-started'],
					['In-progress', 'in-progress'],
					['Complete', 'complete']

				]

		def badge_color
			
			case status 
			when 'complete'
				 'success'
			when 'not-started'
				 'secondary'
			when 'in-progress'
				  'info'
			end
		end

		def readable_status 
			case status 
			when 'complete'
				'Complete' 
			when 'not-started'
				'Not-started' 
			when 'in-progress' 
				'In-progress'
			end
		end 

		def complete? 
			status == 'complete'
		end 
		def not_started? 
			status == 'not-started'
		end 
		def in_progress?
			status == 'in-progress'
		end
	
		def task_completed
			complete_tasks = Task.select {|task| task.complete?}.count 	
		end

		def total_task
			total_task = Task.all.count 	
		end
end


