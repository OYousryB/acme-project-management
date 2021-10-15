Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth_tokens, only: [:create]
      post 'authenticate' => 'auth_tokens#create'

      resources :employees, only: %i[index create update destroy show]
      resources :projects, only: %i[index create update destroy show] do
        post :assign_participant
        delete :remove_participant
      end
    end
  end
end
