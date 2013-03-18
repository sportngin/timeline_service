FactoryGirl.define do
  sequence(:user_id) do |n|
    n
  end

  sequence(:action_type) do |n|
    # randomly pick from a list
    %w(
      log-in
      log-out
      page-create
      game-create
    ).sample
  end

  sequence(:happened_at) do |n|
    rand(10000).minutes.ago
  end

  factory :entry do
    user_id
    action_type
    happened_at
    metadata { Hash.new }
  end
end
