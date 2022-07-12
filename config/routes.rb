Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/daycares', to: 'daycares#index'
  get '/daycares/:id', to: 'daycares#show'
  get '/teachers', to: 'teachers#index'
  get '/teachers/:id', to: 'teachers#show'
end
