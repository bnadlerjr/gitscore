module Gitscore
  module Adapters
    class Github
      def fetch_profile(username)
        response = HTTParty.get("http://github.com/#{username}.json")
        data = JSON.parse(response.body)
        UserProfile.new(
          username: data[0]["actor"],
          name: data[0]["actor_attributes"]["name"]
        )
      end
    end
  end
end
