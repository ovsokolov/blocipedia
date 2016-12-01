Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  get 'welcome/index'
  root 'welcome#index'
  resources :wikis do
    get 'collaborators'
    post 'save_collaborators' 
  end
  resources :charges, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
