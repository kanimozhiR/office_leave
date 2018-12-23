class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.integer :empid
      t.string :requester_emp_id
      t.date :start_date
      t.date :end_date
      t.integer :no_of_days
      t.string :leave_type
      t.date :action_date
      t.text :request_remarks
      t.text :action_remarks
      t.string :status

      t.timestamps
    end
  end
end
