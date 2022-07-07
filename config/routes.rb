Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post '/', to: 'authentication#register'
      post '/login', to: 'authentication#login'
    end
    resources :pelapor, :pegawai
    # namespace :users do
    #   resource :users, param: :_id
    # end
  end
end
