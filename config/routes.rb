Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post '/', to: 'authentication#register'
      post '/login', to: 'authentication#login'
    end
    resources :pelapor, :pegawai, :kejadian, :posko, :kerusakan, :penanggulangan, 
    :logistik, :penerima, :petuga, :distribusi
    
    resources :users, :except => [:create, :index]
  end
end
