class MyPagesController < Simplemvc::Controller
  attr_reader :name

  def about
    render :about, name: "kalina.tech"
  end

  def tell_me
    @name = "Kalina.tech from instance var"
  end
end
