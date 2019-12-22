Rails.application.routes.draw do

  resources :trips
  resources :items

  get '/top_frequent_items', to: 'stats#top_frequent_items'
  get '/top_spend_items', to: 'stats#top_spend_items'
  get '/avg_spend_per_trip', to: 'stats#avg_spend_per_trip'
  get '/avg_time_between_trips', to: 'stats#avg_time_between_trips'
  get '/avg_time_between_purchases', to: 'stats#avg_time_between_purchases'
  get '/last_trip_total', to: 'stats#last_trip_total'

end
