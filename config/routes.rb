Rails.application.routes.draw do
  # resources :snippets
  resources :users

  post 'signin', to: 'users#signin'
  get 'validate', to: 'users#validate'
  get 'snippets', to: 'users#get_snippets'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
