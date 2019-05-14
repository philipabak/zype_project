Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root controller: :videos, action: :index

  resources :videos do
    post 'login', on: :member
  end

end
