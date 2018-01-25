Rails.application.routes.draw do


 

  root to: "usuarios#index"

  #Redefinir senha controller
  get 'redefinir_senha/busca', to: "redefinir_senha#busca", as: :redefinir_senha
  post 'redefinir_senha/busca', to: "redefinir_senha#recuperar"

  #comentários controller
  resources :comentarios


  #Posts controller
  patch 'curtir/:post_id', to: "posts#curtir", as: :curtir
  patch 'descurtir/:post_id', to: "posts#descurtir", as: :descurtir
  get 'feed', to: "posts#feed", as: :feed
  resources :posts


  #Sessoes controller
  get 'login', to: "sessoes#new", as: :login
  post 'login', to: "sessoes#create"
  delete 'logout', to: "sessoes#destroy", as: :logout

  # Usuarios controller

  patch 'buscacidades', to: "usuarios#buscacidades", as: :buscacidades
  get 'usuarios/novo', to:"usuarios#new", as: :new_usuario
  post 'usuarios/novo', to:"usuarios#create"
  get 'usuarios/editar/:id', to: "usuarios#edit", as: :edit_usuario
  patch 'usuarios/editar/:id', to: "usuarios#update"
  
  
  #Ao se utilizar rotas que possuem parametros, coloca-las
  #por ultimo.
  #se não o Rails vai confundir o nome da rota com um parametro
  get 'usuarios/:id', to: "usuarios#show", as: :show_usuario
  delete 'usuarios/:id', to: "usuarios#destroy", as: :destroy_usuario 

  get 'usuarios', to: "usuarios#index", as: :index_usuarios

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
