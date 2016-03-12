module Simplemvc
  class Router
    def initialize
      @routes = []
    end

    def match url, *args
      @routes << {
        regexp: Regexp.new("^#{url}$"),
        target: args.shift
      }
    end

    def check_url url
      @routes.each do |route|
        if route[:regexp].match url
          if route[:target] =~ /^([^#]+)#([^#]+)$/
            controller_name = $1.camelize + "Controller"
            controller = Object.const_get controller_name

            return controller.action($2)
          end
        end
      end
    end
  end

  class Application
    def route &block
      @router ||= Router.new
      @router.instance_eval &block
    end

    def get_rack_app env
      @router.check_url env["PATH_INFO"]
    end
  end
end
