class MyPagesController < Simplemvc::Controller
  attr_reader :name

  def about
    p params["id"]
    render :about, name: "kalina.tech"
  end

  def tell_me
    @name = "Kalina.tech from instance var"
  end
end
