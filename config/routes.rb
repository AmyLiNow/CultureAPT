Rails.application.routes.draw do
  
  get '/suggestions/thank_you' 
  

  root 'home#map'
  get 'home/map'
  get 'home/list'

  
  resources :suggestions
  resources :venues
  resources :orgs
  resources :events

end
