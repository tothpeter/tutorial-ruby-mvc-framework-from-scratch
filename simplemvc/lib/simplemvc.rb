require "simplemvc/version"

class String
  def titleize
    gsub('-', '_').split('_').map(&:capitalize).join
  end
end

module Simplemvc
  class Application
    def call env
      if env["PATH_INFO"] == "/"
        return [ 302, { "Location" => "/pages/about" }, [] ]
      end

      controller_class, action = get_controller_and_action env
      response = controller_class.new.send action

      [ 200, { "Content-Type" => "text/html"}, [ response ] ]
    end

    def get_controller_and_action env
      _, controlle_name, action = env["PATH_INFO"].split "/"

      controller_name = controlle_name.titleize + "Controller"

      controller_class = Object.const_get controller_name

      [controller_class, action]
    end
  end
end
