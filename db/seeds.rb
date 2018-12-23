# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Employee.create(:name => "Admin", :empid => "1111", :age => 28, :gender => "Female", :dob => '1989-01-01'.to_date, :doj => '2001-01-01'.to_date,  :designation => 'Admin',  :manager_name => 'Manager', :phone => '9876543210', :email_id => 'admin@gmail.com', :encashed_days=>0, :role => 'Admin')
User.create(:email => "admin@gmail.com",:password => 'password', :password_confirmation=> 'password', :employee_id=>1)