Rails.application.routes.draw do
  
  # send users to the angular application
  root to: "application#angular"
  
  # json api for angular frontend
  get '/api/direction' => 'directions#current'
  
  get '*path' => "home#index"
  
end
