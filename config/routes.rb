Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/daycares', to: 'daycares#index'
  get 'daycares/new', to: 'daycares#new'
  post '/daycares', to: 'daycares#create'
  get '/daycares/:id', to: 'daycares#show'
  get '/daycares/:id/edit', to: 'daycares#edit'
  patch '/daycares/:id', to: 'daycares#update'

  get '/teachers', to: 'teachers#index'
  get '/teachers/:id', to: 'teachers#show'
  post '/teachers/:id', to: 'teachers#update'
  post '/teachers/:id/edit', to: 'teachers#edit'
  get '/teachers/:id/edit', to: 'teachers#edit'
  patch '/daycares/:id/', to: 'teachers#update'

  get '/daycares/:id/teachers', to: 'daycare_teachers#index'
  post '/daycares/:id/teachers/new', to: 'daycare_teachers#new'
  post '/daycares/:id/teachers', to: 'daycare_teachers#create'
  get '/daycares/:id/teachers/sort', to: 'daycare_teachers#sort'
end
