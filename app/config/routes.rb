Rails.application.routes.draw do
  get '/login'  => 'user#login'
  post '/login' => 'user#login_form'

  get '/register'  =>  'user#register'
  post '/register' =>  'user#register_form'

  get '/signout' => 'user#signout'
  get '/' => 'home#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
