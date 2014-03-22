require "bundler/setup"
require "dotenv"
Dotenv.load
require File.expand_path("../app", __FILE__)
app = Gitscore::App
app.set :github, Gitscore::Adapters::Github.new
run app
