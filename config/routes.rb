Rails.application.routes.draw do
  resources :reminders
  root to: 'reminders#new'
end
