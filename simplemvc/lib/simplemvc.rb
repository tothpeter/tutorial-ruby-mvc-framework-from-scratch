require "simplemvc/version"

module Simplemvc
  class Application
    def call env
      [ 200, { "Content-Type" => "text/html"}, [ "<em>Hello<em>" ] ]
    end
  end
end
