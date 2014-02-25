CookBook::Application.routes.draw do
  resources :chefs
  resources :recipes
  resources :static_pages
end
