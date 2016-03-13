require './config/application.rb'

app = Blog::Application.new

app.route do
  match "/", "home#index"

  # match "/my_pages/about", "my_pages#about"
  # match "/my_pages/tell_me", "my_pages#tell_me"

  match "/:controller/asd/:action/:id"
end

run app
