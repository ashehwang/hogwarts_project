class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :subject_id, null: false
      t.integer :student_id

      t.timestamps
    end
  end
end
