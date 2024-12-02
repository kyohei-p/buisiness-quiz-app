Rails.application.routes.draw do
  namespace 'api' do
    namespace 'users' do
      get "/login", to: "sessions#new"
      post "/login", to: 'sessions#create'
      delete "/logout", to: 'sessions#destroy', as: :logout

      get '/auth/auth0/callback' => 'auth0#create'
      get '/auth/failure' => 'auth0#failure'
      get '/auth/logout' => 'auth0#logout'
    end
  end
end
