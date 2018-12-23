class Leave < ApplicationRecord

belongs_to :employee, :class_name => 'Employee', :foreign_key => 'employee_id'
validate :end_date_grt_than_start_date, :if => Proc.new{|a| a.status=="New"}
validates_presence_of :leave_type
validates_presence_of :start_date, :end_date, :no_of_days
validates_numericality_of :no_of_days, :only_integer => true, :message => "Please enter a whole no for no. of days of leave"
#validates_date :start_date, :end_date

def self.search(search)
  where("empid =?", "#{search}") 
end

end
