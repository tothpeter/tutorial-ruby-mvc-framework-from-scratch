module Simplemvc
  class Router
    def initialize
      @routes = []
    end

    def match url, *args
      target = nil
      # url.include? ':'
      target = args.shift if args.size > 0

      url_parts = url.split '/'
      url_parts.select! { |part| !part.empty? }
      placeholders = []

      regexp = url_parts.map do |url_part|
        if url_part[0] == ':'
          placeholders << url_part[1..-1]
          "([^\/]+)"
        else
          url_part
        end
      end

      @routes << {
        regexp: Regexp.new("^/#{regexp.join('/')}$"),
        target: target,
        placeholders: placeholders
      }
    end

    def check_url url
      @routes.each do |route|
        match = route[:regexp].match url
        params = {}

        if match
          if route[:target] =~ /^([^#]+)#([^#]+)$/
            params["controller"] = $1
            params["action"] = $2
          else
            route[:placeholders].each_with_index do |placeholder, index|
              params[placeholder] = match.captures[index]
            end
          end

          controller = Object.const_get(params["controller"].camelize + "Controller")
          return controller.action params["action"], params
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
