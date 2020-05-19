class ChangeFacultiesColumn < ActiveRecord::Migration[5.2]
  def change

    remove_column :faculties, :subject
    add_column :faculties, :subject, :string
    add_column :faculties, :title, :string
  end
end
