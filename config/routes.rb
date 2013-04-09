Ca::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'welcome#index'
  match ':controller(/:action(/:id))(.:format)'
end
