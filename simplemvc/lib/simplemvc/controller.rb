require 'erubis'

module Simplemvc
  class Controller
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
