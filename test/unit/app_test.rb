require_relative "../test_helper"
require_relative "../../app/user_profile"
require_relative "../../app/event"

class FakeGithub
  def fetch_profile(username)
    profile = Gitscore::UserProfile.new(
      username: "bnadlerjr",
      name: "Bob Nadler"
    )

    profile.events << Gitscore::Event.new(type: "WatchEvent")
    profile.events << Gitscore::Event.new(type: "IssueEvent")
    profile
  end
end

class AppTest < Rack::Test::TestCase
  test "GET /" do
    get "/"
    assert_response :ok
  end

  test "GET username" do
    app.set :github, FakeGithub.new
    get "/bnadlerjr"
    assert_response :ok
    assert_body_contains "bnadlerjr"
    assert_body_contains "Bob Nadler"
    assert_body_contains "Score: 4"
  end
end
