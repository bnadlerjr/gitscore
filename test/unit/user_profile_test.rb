require_relative "../test_helper"
require_relative "../../app/user_profile"
require_relative "../../app/event"

module Gitscore
  class UserProfileTest < Test::Unit::TestCase
    test "has events" do
      profile = UserProfile.new
      event = Event.new(type: "WatchEvent")
      profile.events << event
      assert_equal([event], profile.events)
    end

    test "calculate score" do
      profile = UserProfile.new
      profile.events << Event.new(type: "WatchEvent")
      profile.events << Event.new(type: "IssueEvent")
      assert_equal(4, profile.score)
    end
  end
end
