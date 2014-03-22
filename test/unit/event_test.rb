require_relative "../test_helper"
require_relative "../../app/event"

module Gitscore
  class EventTest < Test::Unit::TestCase
    test "assigns a score" do
      event = Event.new(type: "WatchEvent")
      assert_equal(1, event.score)
    end

    test "assign a score of zero for unknown event" do
      event = Event.new(type: "UnknownEvent")
      assert_equal(0, event.score)
    end
  end
end
