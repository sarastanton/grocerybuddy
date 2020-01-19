Rails.application.routes.draw do

  resources :items

  get 'stats', to: 'stats#stats'

end
