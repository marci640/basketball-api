Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/conferences' => 'conferences#index'
      get '/teams' => 'teams#index'
    end
  end
end
