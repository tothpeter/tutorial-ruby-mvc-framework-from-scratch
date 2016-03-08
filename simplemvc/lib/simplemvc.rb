require "simplemvc/version"
require "simplemvc/controller"
require "simplemvc/utils"
require "simplemvc/dependencies"

module Simplemvc
  class Application
    def call env
      if env["PATH_INFO"] == "/"
        return [ 302, { "Location" => "/my_pages/about" }, [] ]
      end

      controller_class, action = get_controller_and_action env
      controller_class.new(env).dispatch(action)
    end

    def get_controller_and_action env
      _, controlle_name, action = env["PATH_INFO"].split "/"

      controller_name = controlle_name.camelize + "Controller"

      controller_class = Object.const_get controller_name

      [controller_class, action]
    end
  end
end
