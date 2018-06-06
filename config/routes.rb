Rails.application.routes.draw do
  root to: 'pages#home'
  get 'infos-pratiques', to: "pages#infos", as: :infos

  get 'components', to: 'pages#components'
  get 'landing', to: 'pages#landing'
end
