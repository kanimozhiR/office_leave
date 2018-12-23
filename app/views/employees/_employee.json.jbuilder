json.extract! employee, :id, :name, :empid, :age, :gender, :dob, :doj, :designation, :role, :phone, :email_id, :encashed_days, :separation_date, :manager_name, :created_at, :updated_at
json.url employee_url(employee, format: :json)
