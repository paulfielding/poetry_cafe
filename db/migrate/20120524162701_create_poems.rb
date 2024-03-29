class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :poems, [:user_id, :created_at]
  end
end
