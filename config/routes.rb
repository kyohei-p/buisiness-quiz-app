Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      get "/login", to: "sessions#new"
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy", as: :logout

      get "/auth/auth0/callback" => "auth0#create"
      get "/auth/failure" => "auth0#failure"
      get "/auth/logout" => "auth0#logout"

      resources :categories, only: [:index]

      resources :users, only: [:create, :show, :update, :destroy] do
        post 'categories/:id', to: 'categories#selected_category'
        # delete 'categories/:id', to: 'categories#reset_category'
      end
    end
  end
end
