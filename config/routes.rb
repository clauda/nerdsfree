Nerdsfree::Application.routes.draw do
  root :to => "nerds#index"
  match "nerds/new", :to => "nerds#new", :as => "new_nerd"
  match "nerds/create", :to => "nerds#create", :as => "create_nerd"
  match "nerds/:id", :to => "nerds#destroy", :as => "destroy"
  match "tag/:name", :to => "nerds#tags", :as => "tag"
  match "confirm/:token", :to => "nerds#confirm"
  match "remove/:token", :to => "nerds#remove"
  match "search" => "nerds#search", :as => 'search'
end
