require "simplemvc/version"
require "simplemvc/controller"
require "simplemvc/utils"
require "simplemvc/dependencies"
require "simplemvc/routing"

module Simplemvc
  class Application
    def call env
      get_rack_app(env).call(env)
    end
  end
end
