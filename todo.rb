#!/usr/bin/env ruby

class Task
	attr_accessor :name, :due, :owner, :completed, :count, :allTasks
	@@count = 0
	@@allTasks = []
	@@days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

	def initialize (name, due, owner, completed = false)
		@name = name
		@due = due
		@owner = owner
		@completed = completed

		@@count += 1
		@@allTasks << self
	end

	def self.count
		@@count
	end

	def self.allTasks
		@@allTasks
	end

	def self.completed_tasks
		@@allTasks.each do |task|
			if task.completed == true
				puts task.name
			end
		end
	end

	def self.remaining_tasks
		@@allTasks.each do |task|
			if task.completed == false
				puts task.name
			end
		end
	end

	def mark_completed
		@completed = true
	end

	def procrastinate
		@@days.each_with_index do |day, i|
  			if @due == "Saturday"
  				@next_day = "Sunday"
  			else
  				@next_day = @@days[i+1] 
  			end

  		if @@days[i] == @due
  			@due = @next_day
  			puts @due
  			break
			end
		end
	end


	def delegate_to(newOwner)
		@owner = newOwner
	end

end


