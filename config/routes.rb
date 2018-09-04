Rails.application.routes.draw do
  get '/users/:username', to: 'users#access'
end
