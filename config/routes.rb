Rails.application.routes.draw do
  root :to => 'info#index'
  get "top" => 'homes#top'
  resources :books
end
