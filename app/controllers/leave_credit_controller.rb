class LeaveCreditController < ApplicationController

	def leave_credit
	end

	def leave_credit_create
	 	@emp = Employee.where("role !=?", "Admin")
		if @emp.count!=[]
			@emp.each do |e|
	         for l in 1..3
	         	@le = Leave.new
	         	@le.empid=e.empid
	         	@le.start_date=@le.end_date=@le.action_date=DateTime.now
	         	if l==1
		         	@le.leave_type = "Casual Leave"
		         	@le.no_of_days = 6
		        elsif l==2
		         	@le.leave_type = "Sick Leave"
		         	@le.no_of_days = 6
		         elsif l==3
		         	@le.leave_type = "Earned Leave"
		         	@le.no_of_days =12
		         end	
		         @le.action_remarks = 'auto-lapsed'
		         @le.status='Credit'
		         @le.employee_id = e.id
		         @le.request_remarks = 'Credited by Admin'
		         @le.save
	         end
			end
		end
		redirect_to :root
	end






end
