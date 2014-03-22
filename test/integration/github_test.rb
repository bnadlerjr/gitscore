require_relative "../test_helper"
require_relative "../../app/adapters/github"
require_relative "../../app/user_profile"
require "httparty"

module Gitscore
  module Adapters
    class GithubTest < Test::Unit::TestCase
      test "fetch profile" do
        github = Github.new
        profile = github.fetch_profile("bnadlerjr")
        assert_equal("bnadlerjr", profile.username)
        assert_equal("Bob Nadler", profile.name)
      end
    end
  end
end
