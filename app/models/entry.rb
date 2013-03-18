class Entry < ActiveRecord::Base
  scope_accessible :user
  scope_accessible :action
  scope_accessible :before
  scope_accessible :after

  # Public: Filter results by the given user_id
  #
  # user_id - ID of the user to search for
  #
  # Returns a Relation
  def self.user(user_id)
    where(user_id: user_id)
  end

  # Public: Filter entries by the given action type
  #
  # action_type - Key identifying the action to search for
  #
  # Returns a Relation
  def self.action(action_type)
    where(action_type: action_type)
  end

  # Public: Filter entries which occur before the given DateTime
  #
  # timeish - The DateTime to compare with
  #
  # Returns a Relation
  def self.before(timeish)
    where("happened_at <= ?", timeish)
  end

  # Public: Filter entries which occur after the given DateTime
  #
  # timeish - The DateTime to compare with
  #
  # Returns a Relation
  def self.after(timeish)
    where("happened_at >= ?", timeish)
  end


end
