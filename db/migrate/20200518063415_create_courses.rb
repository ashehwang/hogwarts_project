class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :subject, null: false
      t.integer :professor_id
    end
  end
end
