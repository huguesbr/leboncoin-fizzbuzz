Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/fizzbuzz", to: "fizzbuzz#show"
  resources :request_statistics, only: [:index]
end
