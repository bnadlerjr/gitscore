module Gitscore
  module Adapters
    class Github
      def fetch_profile(username)
        response = HTTParty.get("http://github.com/#{username}.json")
        data = JSON.parse(response.body)
        profile = UserProfile.new(
          username: data[0]["actor"],
          name: data[0]["actor_attributes"]["name"]
        )

        data.each do |item|
          profile.events << Event.new(type: item["type"])
        end
        profile
      end
    end
  end
end
