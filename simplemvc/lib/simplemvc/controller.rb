require 'erubis'

module Simplemvc
  class Controller
    attr_reader :request

    def initialize env
      @request ||= Rack::Request.new env
    end

    def params
      request.params
    end

    def render *args
      response(render_template(*args))
    end

    def response body, status = 200, headers = {"Content-Type" => "text/html"}
      @response = Rack::Response.new body, status, headers
    end

    def get_response
      @response
    end

    def render_template view_name, locals = {}
      file_name = File.join("app", "views", controller_name, "#{view_name}.erb")
      template = File.read file_name

      Erubis::Eruby.new(template).result locals
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").underscore
    end
  end
end
