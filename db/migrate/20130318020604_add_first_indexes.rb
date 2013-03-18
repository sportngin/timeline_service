class AddFirstIndexes < ActiveRecord::Migration
  def change
    add_index :entries, :user_id
    add_index :entries, :action_type
    add_index :entries, :happened_at
  end
end
