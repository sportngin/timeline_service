json.array!(@entries) do |entry|
  json.extract! entry, :id
  # json.extract! entry, :user_id, :action_type, :happened_at, :metadata
  # json.url entry_url(entry, format: :json)
end
