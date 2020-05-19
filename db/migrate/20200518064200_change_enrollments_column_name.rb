class ChangeEnrollmentsColumnName < ActiveRecord::Migration[5.2]
  def change

    rename_column :enrollments, :subject_id, :course_id

  end
end
