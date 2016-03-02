require "pp"
require "erubis"

template = "Hello <%= name %>"

eruby = Erubis::Eruby.new template

pp eruby.result name: "Toma"
