class MyPagesController < Simplemvc::Controller
  def about
    render :about, name: "kalina.tech"
  end
end
