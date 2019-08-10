Rails.application.routes.draw do
  get 'about/show'
  resources :projects
  resources :posts do
    resources :comments
  end
  root "posts#index"

end
