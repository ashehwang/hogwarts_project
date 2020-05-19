class CreateFaculties < ActiveRecord::Migration[5.2]
  def change
    create_table :faculties do |t|
      t.string :subject, null: false 
      t.integer :professor_id, null: false
      t.timestamps
    end
  end
end
