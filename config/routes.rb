Nerdsfree::Application.routes.draw do
  resources :nerds
  root :to => "nerds#index"
  match "tag/:name", :to => "nerds#tags", :as => "tag"
end
