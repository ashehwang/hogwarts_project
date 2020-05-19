class CreateHoots < ActiveRecord::Migration[5.2]
  def change
    create_table :hoots do |t|
      t.integer :author_id, null: false
      t.text :body, null: false
      t.integer :parent_hoot_id

      t.timestamps
    end

    add_index :hoots, :author_id
  end
end
