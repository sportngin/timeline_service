class PreventNulls < ActiveRecord::Migration
  def change
    change_column :entries, :user_id, :integer, null: false
    change_column :entries, :action_type, :string, null: false
    change_column :entries, :metadata, :json, null: false
    change_column :entries, :happened_at, :datetime, null: false
  end
end
