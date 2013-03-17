class CreateEvents < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.string :user_name
      t.string :action_type
      t.datetime :happened_at
      t.json :metadata

      t.timestamps
    end
  end
end
