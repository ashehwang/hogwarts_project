class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age
      t.string :gender, null: false
      t.string :house
      t.text :description

      t.timestamps
    end

    add_index :users, [:first_name, :last_name], unique: true
  end
end
