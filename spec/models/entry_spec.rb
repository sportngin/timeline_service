require "spec_helper"

describe Entry do
  context "#valid?" do
    pending
  end

  context ".user(user_id)" do
    let!(:user1) { FactoryGirl.create(:entry, user_id: 1) }
    let!(:user2) { FactoryGirl.create(:entry, user_id: 2) }

    subject { Entry.by_user(2) }

    it "returns only entries with the given user_id" do
      expect(subject.count).to eq(1)
      expect(subject.load).to include user2
    end
  end

  context ".by_action(action_type)" do
    let!(:log_in) { FactoryGirl.create(:entry, action_type: "log-in") }
    let!(:create_page) { FactoryGirl.create(:entry, action_type: "page-create") }

    subject { Entry.by_action("log-in") }

    it "returns only entries with the given action" do
      expect(subject.count).to eq(1)
      expect(subject.load).to include log_in
    end
  end
end
