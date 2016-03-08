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
      controller = controller_class.new(env)
      response = controller.send(action)

      if controller.get_response
        controller.get_response
      else
        [ 200, { "Content-Type" => "text/html" }, [ response ] ]
      end
    end

    def get_controller_and_action env
      _, controlle_name, action = env["PATH_INFO"].split "/"

      controller_name = controlle_name.camelize + "Controller"

      controller_class = Object.const_get controller_name

      [controller_class, action]
    end
  end
end
