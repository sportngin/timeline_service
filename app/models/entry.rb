class Entry < ActiveRecord::Base
  # Public: Filter results by the given user_id
  #
  # user_id - ID of the user to search for
  #
  # Returns a Relation
  def self.by_user(user_id)
    where(user_id: user_id)
  end

  # Public: Filter entries by the given action type
  #
  # action_type - Key identifying the action to search for
  #
  # Returns a Relation
  def self.by_action(action_type)
    where(action_type: action_type)
  end
end
