Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hotspots', to: 'hotspots#index'
  get '/hotspots/new', to: 'hotspots#new'
  get '/hotspots/:id', to: 'hotspots#show'
  get '/birds', to: 'birds#index'
  get '/birds/:id', to: 'birds#show'
  get '/hotspots/:hotspot_id/birds', to: 'hotspot_birds#index'
  post '/hotspots', to: 'hotspots#create'
  get '/hotspots/:id/edit', to: 'hotspots#edit'
  patch '/hotspots/:id', to: 'hotspots#update'
  get '/hotspots/:hotspot_id/birds/new', to: 'hotspot_birds#new'
  post '/hotspots/:hotspot_id/birds', to: 'hotspot_birds#create'
  get '/birds/:id/edit', to: 'birds#edit'
  patch '/birds/:id', to: 'birds#update'
end
