class Employee < ApplicationRecord

has_many :leaves, :class_name => 'Leave', :foreign_key => 'employee_id'
has_one :user, :dependent => :destroy

validates_presence_of :age, :message => "Unable to calculate employee's age at joining; please enter employee dob correctly.."
validates_presence_of :designation, :message => "Employee's designation at  cannot be blank"
validates_presence_of :dob, :message => "Employee's date of birth cannot be blank"
validates_presence_of :doj, :message => "Employee's date of joining  cannot be blank"
validates_presence_of :name, :message => "Employee's name cannot be blank"
validates_presence_of :manager_name, :message => "Employee's manager name cannot be blank"
validates_presence_of :phone, :message => "Employee's mobile number cannot be blank"
validates_presence_of :email_id, :message => "Employee's  email id cannot be blank"
validates_presence_of :role, :message => "Employee roles cannot be blank"
validates_presence_of :gender, :message => "Employee gender cannot be blank"

validates_uniqueness_of :phone, :message => "Employee mobile no has to be unique"
validates_uniqueness_of :email_id, :message => "Employee's  email id should be unique"



validates_length_of :phone, :is => 10, :message => "Mobile number entry should contain 10 digits"

validates_numericality_of :age, :only_integer => true, :greater_than_or_equal_to => 18, :message => "Employee should be greater than 18 years of age"
validates_numericality_of :phone, :only_integer => true, :greater_than_or_equal_to => 0, :message => " Please enter a valid numerical value for employee's phone no"






end
