require "spec_helper"

describe Entry do
  context "#valid?" do
    let(:entry) { FactoryGirl.build(:entry) }

    it "is true for the default factory" do
      expect(entry).to be_valid
    end

    it "is false if the user_id is missing" do
      entry.user_id = nil
      expect(entry).to_not be_valid
    end

    it "is false if the action_type is missing" do
      entry.action_type = nil
      expect(entry).to_not be_valid
    end

    it "is false if the happened_at is missing" do
      entry.happened_at = nil
      expect(entry).to_not be_valid
    end
  end

  context ".periscope(criteria)" do
    it "can filter by user_id" do
      user1 = FactoryGirl.create(:entry, user_id: 1)
      user2 = FactoryGirl.create(:entry, user_id: 2)

      entries = Entry.periscope(user: 1)
      expect(entries.load).to include user1
      expect(entries.load).to_not include user2
    end

    it "can filter by action_type" do
      log_in = FactoryGirl.create(:entry, action_type: "log-in")
      create_page = FactoryGirl.create(:entry, action_type: "page-create")

      entries = Entry.periscope(action: "log-in")
      expect(entries.load).to include log_in
      expect(entries.load).to_not include create_page
    end

    it "can filter by date" do
      yesterday = FactoryGirl.create(:entry, happened_at: 1.day.ago)
      week_ago = FactoryGirl.create(:entry, happened_at: 1.week.ago)
      mongh_ago = FactoryGirl.create(:entry, happened_at: 1.month.ago)

      entries = Entry.periscope(after: 9.days.ago, before: 2.days.ago)
      expect(entries.load).to include week_ago
      expect(entries.load).to_not include yesterday
      expect(entries.load).to_not include mongh_ago
    end
  end
end
