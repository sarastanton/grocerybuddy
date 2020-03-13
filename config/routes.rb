Rails.application.routes.draw do

  resources :items

  get 'stats', to: 'stats#stats'
  post 'csv_upload', to: 'items#csv_upload'

end
