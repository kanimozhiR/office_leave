class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :empid
      t.integer :age
      t.string :gender
      t.date :dob
      t.date :doj
      t.string :designation
      t.string :role
      t.string :phone
      t.string :email_id
      t.integer :encashed_days
      t.date :separation_date
      t.string :manager_name

      t.timestamps
    end
  end
end
