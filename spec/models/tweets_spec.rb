require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  let(:tweet) { FactoryGirl.build :tweet }

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(140) }
    it { should validate_length_of(:content).is_at_least(1) }
  end

  describe "scopes" do
    describe "default scopes" do
      it "should return a newer tweet first" do
        tweets = Tweet.all
        3.times { FactoryGirl.create :tweet }
        expect(tweets.first.created_at).to be > tweets.last.created_at
      end
    end
  end
end
