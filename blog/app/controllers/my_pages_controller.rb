class MyPagesController < Simplemvc::Controller
  def about
    render :about, name: "kalina.tech"
  end

  def tell_me
    render :tell_me, name: params['name']
    p 'post script'
  end
end
