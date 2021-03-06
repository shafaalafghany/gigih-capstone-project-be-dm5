Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post '/', to: 'authentication#register'
      post '/login', to: 'authentication#login'
    end
    resources :pelapor, :pegawai, :kejadian, :posko, :kerusakan, :penanggulangan, 
    :logistik, :penerima, :petuga, :distribusi, :laporan_bencana, :laporan_bantuan, :dashboard

    resources :users, :except => [:create, :index]
    # namespace :users do
    #   resource :users, param: :_id
    # end
  end
end
