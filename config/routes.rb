Ca::Application.routes.draw do
  root :to => 'welcome#index'
  mount Ckeditor::Engine => '/ckeditor'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config


  match 'novelties' => 'novelties#index', :as => :novelties
  match 'novelties/:id' => 'novelties#index', :as => :novelties_with_cat
  match 'novelty/:id' => 'novelties#show', :as => :novelty

  match 'page/:name_url' => 'welcome#page', :as => :page
  match 'menu/:name_url' => 'welcome#menu', :as => :menu
end
