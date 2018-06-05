Rails.application.routes.draw do
  root to: 'pages#home'

  get 'components', to: 'pages#components'
end
