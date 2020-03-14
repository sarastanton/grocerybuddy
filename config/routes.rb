Rails.application.routes.draw do

  namespace :api do
    resources :items

    get 'stats', to: 'stats#stats'
    post 'csv_upload', to: 'items#csv_upload'
  end

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

end
