Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :articles do
    resources :comments
  end

  root "articles#index"
end
