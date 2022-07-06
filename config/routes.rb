Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post '/login', to: 'authentication#login'
    end
    # namespace :users do
    #   resource :users, param: :_id
    # end
  end
end
