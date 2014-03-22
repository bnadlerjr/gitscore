require_relative "../test_helper"
require_relative "../../app/adapters/github"
require_relative "../../app/user_profile"
require_relative "../../app/event"
require "httparty"

module Gitscore
  module Adapters
    class GithubTest < Test::Unit::TestCase
      test "fetch profile" do
        github = Github.new
        profile = github.fetch_profile("bnadlerjr")
        assert_equal("bnadlerjr", profile.username)
        assert_equal("Bob Nadler", profile.name)
        assert_equal(30, profile.events.count)
      end
    end
  end
end
