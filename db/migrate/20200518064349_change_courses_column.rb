class ChangeCoursesColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :subject, :subject_name
  end
end
