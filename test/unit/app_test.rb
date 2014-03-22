require_relative "../test_helper"
require_relative "../../app/user_profile"

class FakeGithub
  def fetch_profile(username)
    Gitscore::UserProfile.new(
      username: "bnadlerjr",
      name: "Bob Nadler"
    )
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
  end
end
