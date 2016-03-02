require 'rack'

# Lambda/proc                              [ status-code, headers, [ response-text ]]

# Rack::Handler::WEBrick.run -> (env) { [ 200, { "Content-type" => "text/html"}, [ "<em>Hello<em>" ] ] }

# Method

# def startup(env)
#   [ 200, { "Content-Type" => "text/html"}, [ "<em>Hello<em>" ] ]
# end
#
# Rack::Handler::WEBrick.run method(:startup)

# Class

class Application
  def call(env)
    [ 200, { "Content-Type" => "text/html"}, [ "<em>Hello<em>" ] ]
  end
end

Rack::Handler::WEBrick.run Application.new

## Make the Gem
# - bundle gem simplemvc
# - gem build simplemvc.gemspec
# - gem install simplemvc

# - Config.ru
# - config/application.rb

#Run
# bundle exec rackup
