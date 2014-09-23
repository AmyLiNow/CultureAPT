Rails.application.routes.draw do
  
  resources :suggestions

  root 'home#map'
  get 'home/map'
  get 'home/list'

  get 'suggestions/thank_you'

  resources :venues
  resources :orgs
  resources :events

end
