# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#               new_session GET    /session/new(.:format)                                                                   sessions#new
#                   session DELETE /session(.:format)                                                                       sessions#destroy
#                           POST   /session(.:format)                                                                       sessions#create
#                user_index GET    /user(.:format)                                                                          user#index
#                           POST   /user(.:format)                                                                          user#create
#                  new_user GET    /user/new(.:format)                                                                      user#new
#                 edit_user GET    /user/:id/edit(.:format)                                                                 user#edit
#                      user GET    /user/:id(.:format)                                                                      user#show
#                           PATCH  /user/:id(.:format)                                                                      user#update
#                           PUT    /user/:id(.:format)                                                                      user#update
#                           DELETE /user/:id(.:format)                                                                      user#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :bands
end
