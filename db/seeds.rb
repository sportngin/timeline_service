raise("Cannot run in production mode.") if Rails.env.production?

# clean up old data
Entry.destroy_all

SampleUser = Struct.new(:id, :name)

class SampleAction
  attr_accessor :action_type

  def self.random
    new(action_types.sample)
  end

  def self.action_types
    %w(
      log-in
      log-out
      news-article-create
      news-article-update
      page-create
      page-update
      game-create
      game-update
      game-score
    )
  end

  def initialize(action_type)
    self.action_type = action_type
  end

  def metadata
    case action_type
    when /page/
      {id: rand(1000)}
    when /news-article/
      {id: rand(1000), author_id: rand(100)}
    when /game/
      {id: rand(1000), home_team_id: rand(1000), away_team_id: rand(1000)}
    else
      {}
    end
  end

  def happened_at
    @happened_at ||= rand(500000).minutes.ago
  end
end

users = [
  SampleUser.new(rand(1000), "Ronald Hauer"),
  SampleUser.new(rand(1000), "Claude Simon"),
  SampleUser.new(rand(1000), "Deborah Hernandez"),
  SampleUser.new(rand(1000), "Jessica Alkire"),
  SampleUser.new(rand(1000), "Eleanor Wells"),
  SampleUser.new(rand(1000), "Keith Fusco"),
  SampleUser.new(rand(1000), "Blanca Parks"),
  SampleUser.new(rand(1000), "Christopher West"),
  SampleUser.new(rand(1000), "Dawn Bunch"),
  SampleUser.new(rand(1000), "Barbara Rodriquez"),
]

10000.times do
  user = users.sample
  action = SampleAction.random

  Entry.create!({
    user_id: user.id,
    user_name: user.name,
    action_type: action.action_type,
    metadata: action.metadata,
    happened_at: action.happened_at,
  })
end

