require "sinatra/base"
require "rack/csrf"
require_relative "app/adapters/github"
require_relative "app/user_profile"
require "httparty"

Dir.glob(File.join("helpers", "**", "*.rb")).each do |helper|
  require_relative helper
end

module Gitscore
  class App < Sinatra::Base
    set :root, File.dirname(__FILE__)

    enable :logging

    use Rack::Session::Cookie, :secret => "TODO: CHANGE ME"
    use Rack::Csrf, :raise => true

    configure :development do
      require "sinatra/reloader"
      register Sinatra::Reloader
    end

    get "/" do
      erb :index
    end

    get "/:username" do
      @profile = settings.github.fetch_profile(params[:username])
      erb :profile
    end
  end
end
