Rails.application.routes.draw do
  root to: 'pages#landing'

  get 'landing', to: 'pages#landing', as: :landing
  get 'mariage', to: 'pages#wedding', as: :wedding
  get 'infos-pratiques', to: "pages#infos", as: :infos

  get 'components', to: 'pages#components'

  post 'answer', to: 'pages#answer'
end
