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

    def render view_name, locals = {}
      file_name = File.join("app", "views", controller_name, "#{view_name}.erb")
      template = File.read file_name

      Erubis::Eruby.new(template).result locals
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").underscore
    end
  end
end
