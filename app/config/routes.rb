Rails.application.routes.draw do
  get '/admin'              => 'admin#show'
  get '/admin/quizz/:id'    => 'admin#admin_quizz'
  get '/admin/question/:id' => 'admin#admin_question'

  put '/admin/quizz/:id'    => 'admin#update_quizz'
  delete '/admin/quizz/:id' => 'admin#destroy_quizz'

  put '/admin/question/:id'        => 'admin#update_question'
  delete '/admin/question/:id'     => 'admin#destroy_question'
  post '/admin/question' => 'admin#create_question'


  get '/login'     => 'user#login'
  post '/login'    => 'user#login_form'

  get '/register'  =>  'user#register'
  post '/register' =>  'user#register_form'

  get '/quizz/:id'  => 'quizz#show_quizz'
  get '/score/:id'  => 'score#show_score'
  post '/quizz/:id' => 'quizz#validate_quizz'

  get '/signout'  => 'user#signout'
  get '/'         => 'home#home'

end
