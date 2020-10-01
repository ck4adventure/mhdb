# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        static_pages#main
#                                  main GET    /main(.:format)                                                                          static_pages#main
#                                   app GET    /app(.:format)                                                                           static_pages#root
#                     api_items_weapons GET    /api/items/weapons(.:format)                                                             api/items#weapons
#                       api_items_bases GET    /api/items/bases(.:format)                                                               api/items#bases
#                             api_items POST   /api/items(.:format)                                                                     api/items#create
#                              api_item PATCH  /api/items/:id(.:format)                                                                 api/items#update
#                                       PUT    /api/items/:id(.:format)                                                                 api/items#update
#                                       DELETE /api/items/:id(.:format)                                                                 api/items#destroy
#                                 users POST   /users(.:format)                                                                         users#create
#                              new_user GET    /users/new(.:format)                                                                     users#new
#                             edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                                  user GET    /users/:id(.:format)                                                                     users#show
#                                       PATCH  /users/:id(.:format)                                                                     users#update
#                                       PUT    /users/:id(.:format)                                                                     users#update
#                                       DELETE /users/:id(.:format)                                                                     users#destroy
#                           new_session GET    /session/new(.:format)                                                                   sessions#new
#                               session DELETE /session(.:format)                                                                       sessions#destroy
#                                       POST   /session(.:format)                                                                       sessions#create
#                                 ranks GET    /ranks(.:format)                                                                         ranks#index
#                                  rank GET    /ranks/:id(.:format)                                                                     ranks#show
#                               regions GET    /regions(.:format)                                                                       regions#index
#                                region GET    /regions/:id(.:format)                                                                   regions#show
#                         location_mice POST   /locations/:location_id/mouse_locations(.:format)                                        mouse_locations#create
#                        location_mouse DELETE /locations/:location_id/mouse_locations/:id(.:format)                                    mouse_locations#destroy
#                             locations GET    /locations(.:format)                                                                     locations#index
#                                       POST   /locations(.:format)                                                                     locations#create
#                          new_location GET    /locations/new(.:format)                                                                 locations#new
#                         edit_location GET    /locations/:id/edit(.:format)                                                            locations#edit
#                              location GET    /locations/:id(.:format)                                                                 locations#show
#                                       PATCH  /locations/:id(.:format)                                                                 locations#update
#                                       PUT    /locations/:id(.:format)                                                                 locations#update
#                                       DELETE /locations/:id(.:format)                                                                 locations#destroy
#                       mouse_locations POST   /mouses/:mouse_id/mouse_locations(.:format)                                              mouse_locations#create
#                        mouse_location DELETE /mouses/:mouse_id/mouse_locations/:id(.:format)                                          mouse_locations#destroy
#                                  mice GET    /mouses(.:format)                                                                        mouses#index
#                                       POST   /mouses(.:format)                                                                        mouses#create
#                             new_mouse GET    /mouses/new(.:format)                                                                    mouses#new
#                            edit_mouse GET    /mouses/:id/edit(.:format)                                                               mouses#edit
#                                 mouse GET    /mouses/:id(.:format)                                                                    mouses#show
#                                       PATCH  /mouses/:id(.:format)                                                                    mouses#update
#                                       PUT    /mouses/:id(.:format)                                                                    mouses#update
#                                       DELETE /mouses/:id(.:format)                                                                    mouses#destroy
#                weapons_for_power_type GET    /weapons/:power_type(.:format)                                                           items#index
#                                 items GET    /items(.:format)                                                                         items#index
#                                       POST   /items(.:format)                                                                         items#create
#                              new_item GET    /items/new(.:format)                                                                     items#new
#                             edit_item GET    /items/:id/edit(.:format)                                                                items#edit
#                                  item GET    /items/:id(.:format)                                                                     items#show
#                                       PATCH  /items/:id(.:format)                                                                     items#update
#                                       PUT    /items/:id(.:format)                                                                     items#update
#                                       DELETE /items/:id(.:format)                                                                     items#destroy

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#root'

  get '/main', to: 'static_pages#main'
  get '/app', to: 'static_pages#root'

  namespace :api do
    get 'items/weapons', to: 'items#weapons'
    get 'items/bases', to: 'items#bases'
    resources :items, only: [:create, :update, :destroy]

  end

  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]
  resources :ranks, only: [:show, :index]
  resources :regions, only: [:show, :index]
  resources :locations do
    resources :mouse_locations, as: 'mice', only: [:create, :destroy]
  end
  resources :mouses, as: 'mice' do
    resources :mouse_locations, as: 'locations', only: [:create, :destroy]
  end


  get 'weapons/:power_type', to: 'items#index', as: 'weapons_for_power_type'

  resources :items

end
