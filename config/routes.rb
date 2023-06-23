Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
                  path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  # Inicio               
  root to: "articles#index"
  get "/articles", to: "articles#index" , as: "ver"

  # About Us
  get '/about_us', to: "about_us#index", as: "ver_about_us"

  # Productos
  get "/users/:user_id/productos", to: "productos#index", as: "ver_productos"
  get "/users/:user_id/productos/new", to: "productos#new", as: "new_producto"
  post "/users/:user_id/productos/new", to: "productos#create"
  get "/users/:user_id/productos/:id", to: "productos#show", as: "producto"
  get "/users/:user_id/productos/:id/edit", to: "productos#edit", as: "edit_producto"
  patch "/users/:user_id/productos/:id/edit", to: "productos#update"
  delete "/users/:user_id/productos/:id", to: "productos#destroy", as: "destroy_producto"

  # Reseñas
  get "/users/:user_id/productos/:producto_id/resenas", to: "resenas#index", as: "ver_resenas"
  get "/users/:user_id/productos/:producto_id/resenas/new", to: "resenas#new", as: "new_resena"
  post "/users/:user_id/productos/:producto_id/resenas/new", to: "resenas#create"
  get "/users/:user_id/productos/:producto_id/resenas/:id", to: "resenas#show", as: "resena"
  get "/users/:user_id/productos/:producto_id/resenas/:id/edit", to: "resenas#edit", as: "edit_resena"
  patch "/users/:user_id/productos/:producto_id/resenas/:id/edit", to: "resenas#update"
  delete "/users/:user_id/productos/:producto_id/resenas/:id", to: "resenas#destroy", as: "destroy_resena"

  # Compras
  get "/users/:user_id/productos/:producto_id/compras", to: "compras#index", as: "ver_compras"
  get "/users/:user_id/productos/:producto_id/compras/new", to: "compras#new", as: "new_compra"
  post "users/:user_id/productos/:producto_id/compras/new", to: "compras#create"
  get "/users/:user_id/productos/:producto_id/compras/:id", to: "compras#show", as: "compra"
  get "/users/:user_id/productos/:producto_id/compras/:id/edit", to: "compras#edit", as: "edit_compra"
  patch "/users/:user_id/productos/:producto_id/compras/:id/edit", to: "compras#update"
  delete "/users/:user_id/productos/:producto_id/compras/:id", to: "compras#destroy", as: "destroy_compra"

  # Subastums
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums", to: "subasta#index", as: "ver_subastums"
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/new", to: "subasta#new", as: "new_subastum"
  post "users/:user_id/productos/:producto_id/compras/:compra_id/subastums/new", to: "subasta#create"
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:id", to: "subasta#show", as: "subastum"
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:id/edit", to: "subasta#edit", 
as: "edit_subastum"
  patch "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:id/edit", to: "subasta#update"
  delete "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:id", to: "subasta#destroy", 
as: "destroy_subastum"

  # Ofertums
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:subastums_id/ofertums", to: "oferta#index", 
as: "ver_ofertums"
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:subastums_id/ofertums/new", 
      to: "oferta#new", as: "new_ofertum"
  post "users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:subastums_id/ofertums/new", 
       to: "oferta#create"
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:subastums_id/ofertums/:id", 
      to: "oferta#show", as: "ofertum"
  get "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:subastums_id/ofertums/:id/edit", 
      to: "oferta#edit", as: "edit_ofertum"
  patch "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:subastums_id/ofertums/:id/edit", 
        to: "oferta#update"
  delete "/users/:user_id/productos/:producto_id/compras/:compra_id/subastums/:subastums_id/ofertums/:id", 
         to: "oferta#destroy", as: "destroy_ofertum"

  # Chat
  get "/users/:user_id/chats", to: "chats#index", as: "ver_chats"
  get "/users/:user_id/chats/new", to: "chats#new", as: "new_chat"
  post "/users/:user_id/chats/new", to: "chats#create"
  get "/users/:user_id/chats/:id", to: "chats#show", as: "chat"
  get "/users/:user_id/chats/:id/edit", to: "chats#edit", as: "edit_chat"
  patch "/users/:user_id/chats/:id/edit", to: "chats#update"
  delete "/users/:user_id/chats/:id", to: "chats#destroy", as: "destroy_chat"

  # Mensajes
  get "/users/:user_id/chats/:chat_id/mensajes", to: "mensajes#index", as: "ver_mensajes"
  get "/users/:user_id/chats/:chat_id/mensajes/new", to: "mensajes#new", as: "new_mensaje"
  post "/users/:user_id/chats/:chat_id/mensajes/new", to: "mensajes#create"
  get "/users/:user_id/chats/:chat_id/mensajes/:id", to: "mensajes#show", as: "mensaje"
  get "/users/:user_id/chats/:chat_id/mensajes/:id/edit", to: "mensajes#edit", as: "edit_mensaje"
  patch "/users/:user_id/chats/:chat_id/mensajes/:id/edit", to: "mensajes#update"
  delete "/users/:user_id/chats/:chat_id/mensajes/:id", to: "mensajes#destroy", as: "destroy_mensaje"

  # Likes
  get "/users/:user_id/likes", to: "likes#index", as: "ver_likes"
  get "/users/:user_id/productos/:producto_id/likes/new", to: "likes#new", as: "new_like"
  post "/users/:user_id/productos/:producto_id/likes/new", to: "likes#create", as: "crear_like"
  delete "/users/:user_id/likes/:id", to: "likes#destroy", as: "destroy_like"

end