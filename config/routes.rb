# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        static_pages#main
#                                 users GET    /users(.:format)                                                                         users#index
#                                       POST   /users(.:format)                                                                         users#create
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
#                             locations GET    /locations(.:format)                                                                     locations#index
#                                       POST   /locations(.:format)                                                                     locations#create
#                          new_location GET    /locations/new(.:format)                                                                 locations#new
#                         edit_location GET    /locations/:id/edit(.:format)                                                            locations#edit
#                              location GET    /locations/:id(.:format)                                                                 locations#show
#                                       PATCH  /locations/:id(.:format)                                                                 locations#update
#                                       PUT    /locations/:id(.:format)                                                                 locations#update
#                                       DELETE /locations/:id(.:format)                                                                 locations#destroy
#                       mouse_locations GET    /mouses/:mouse_id/mouse_locations(.:format)                                              mouse_locations#index
#                                       POST   /mouses/:mouse_id/mouse_locations(.:format)                                              mouse_locations#create
#                    new_mouse_location GET    /mouses/:mouse_id/mouse_locations/new(.:format)                                          mouse_locations#new
#                        mouse_location DELETE /mouses/:mouse_id/mouse_locations/:id(.:format)                                          mouse_locations#destroy
#                                  mice GET    /mouses(.:format)                                                                        mouses#index
#                                       POST   /mouses(.:format)                                                                        mouses#create
#                             new_mouse GET    /mouses/new(.:format)                                                                    mouses#new
#                            edit_mouse GET    /mouses/:id/edit(.:format)                                                               mouses#edit
#                                 mouse GET    /mouses/:id(.:format)                                                                    mouses#show
#                                       PATCH  /mouses/:id(.:format)                                                                    mouses#update
#                                       PUT    /mouses/:id(.:format)                                                                    mouses#update
#                                       DELETE /mouses/:id(.:format)                                                                    mouses#destroy


Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#main'

  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :ranks, only: [:show, :index]
  resources :regions, only: [:show, :index]
  resources :locations
  resources :mouses, as: 'mice' do
    resources :mouse_locations, as: 'locations', only: [:index, :new, :create, :destroy]
  end
end
