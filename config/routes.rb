Nerdsfree::Application.routes.draw do
  root :to => "nerds#index"
  match "nerds/new" => "nerds#new", :as => "new_nerd"
  match "nerds/create" => "nerds#create", :as => "create_nerd"
  match "nerds/:id" => "nerds#destroy", :as => "destroy"
  match "tag/:id/" => "nerds#tags", :as => "tag"
  match "confirm/:token" => "nerds#confirm"
  match "remove/:token" => "nerds#remove"
  match "search" => "nerds#search", :as => "search"
  match "faq" => "nerds#faq", :as => "faq"
end
