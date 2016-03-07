require 'rack'
require "pp"

# Rack::Handler::WEBrick.run -> (env) { puts Rack::Request.new(env).inspect; [ 200, {}, [] ] }

# Rack::Handler::WEBrick.run -> (env) { Rack::Response.new [ ], 302, { "location" => "http://tomaaa.com"  } }

class Person
  def initialize
    @name = "Mike"
    @age = 22
  end
end

pp Person.new.instance_variables