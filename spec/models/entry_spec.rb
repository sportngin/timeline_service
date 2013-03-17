require "spec_helper"

describe Entry do
  context "#valid?" do
    pending
  end

  context ".periscope(criteria)" do
    it "can filter by user_id" do
      user1 = FactoryGirl.create(:entry, user_id: 1)
      user2 = FactoryGirl.create(:entry, user_id: 2)

      entries = Entry.periscope(user: 1)
      expect(entries.count).to eq(1)
      expect(entries.load).to include user1
    end

    it "can filter by action_type" do
      log_in = FactoryGirl.create(:entry, action_type: "log-in")
      create_page = FactoryGirl.create(:entry, action_type: "page-create")

      entries = Entry.periscope(action: "log-in")
      expect(entries.count).to eq(1)
      expect(entries.load).to include log_in
    end
  end

  context ".user(user_id)" do
    let!(:user1) { FactoryGirl.create(:entry, user_id: 1) }
    let!(:user2) { FactoryGirl.create(:entry, user_id: 2) }

    subject { Entry.user(2) }

    it "returns only entries with the given user_id" do
      expect(subject.count).to eq(1)
      expect(subject.load).to include user2
    end
  end

  context ".action(action_type)" do
    let!(:log_in) { FactoryGirl.create(:entry, action_type: "log-in") }
    let!(:create_page) { FactoryGirl.create(:entry, action_type: "page-create") }

    subject { Entry.action("log-in") }

    it "returns only entries with the given action" do
      expect(subject.count).to eq(1)
      expect(subject.load).to include log_in
    end
  end
end
