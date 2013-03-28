require "yaml"
if RUBY_VERSION.include? "1.9"
  YAML::ENGINE.yamler= "syck"
end

require "sprockets"
env = Sprockets::Environment.new

require "handlebars_assets"
env.append_path HandlebarsAssets.path

# Load the rails application
require File.expand_path("../application", __FILE__)

# Initialize the rails application
Babyio::Application.initialize!
