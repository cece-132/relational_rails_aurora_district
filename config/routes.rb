Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/daycares', to: 'daycares#index'
  get 'daycares/new', to: 'daycares#new'
  post '/daycares', to: 'daycares#create'
  get '/daycares/:id', to: 'daycares#show'

  get '/teachers', to: 'teachers#index'
  get '/teachers/:id', to: 'teachers#show'

  get '/daycares/:id/teachers', to: 'daycare_teachers#index'

end
