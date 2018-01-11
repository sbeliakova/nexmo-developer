Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  namespace :feedback do
    resources :feedbacks
  end

  get '/robots.txt', to: 'static#robots'

  get 'markdown/show'

  get '/signout', to: 'sessions#destroy'

  post '/jobs/code_example_push', to: 'jobs#code_example_push'
  post '/jobs/open_pull_request', to: 'jobs#open_pull_request'

  get '/stats', to: 'dashboard#stats'

  get '/tutorials', to: 'tutorials#index'
  get '/tutorials/*document(/:code_language)', to: 'tutorials#show', constraints: DocumentationConstraint.code_language
  get '/*product/tutorials', to: 'tutorials#index', constraints: DocumentationConstraint.product_with_parent

  get '/documentation', to: 'static#documentation'

  get '/legacy', to: 'static#legacy'
  get '/team', to: 'static#team'

  get '/community/slack', to: 'slack#join'
  post '/community/slack', to: 'slack#invite'

  get '/tools', to: 'static#tools'
  get '/community', to: 'static#community'
  get '/community/past-events', to: 'static#past_events'

  get '/feeds/events', to: 'feeds#events'

  get '/changelog', to: 'changelog#index'
  get '/changelog/:version', to: 'changelog#show', constraints: { version: /\d\.\d\.\d/ }

  match '/search', to: 'search#results', via: [:get, :post]

  get '/api', to: 'api#index'

  get '/api/*definition(/:code_language)', to: 'open_api#show', as: 'open_api', constraints: { definition: /sms|number\-insight/ }
  get '/api/*document(/:code_language)', to: 'api#show', constraints: DocumentationConstraint.code_language

  get '/*product/(api|ncco)-reference', to: 'markdown#api'

  scope "(:namespace)", namespace: /contribute/, defaults: { namespace: '' } do
    get '/*document(/:code_language)', to: 'markdown#show', constraints: DocumentationConstraint.documentation
  end

  get '/:product/*document(/:code_language)', to: 'markdown#show', constraints: DocumentationConstraint.documentation

  get '*unmatched_route', to: 'application#not_found'

  root 'static#landing'
end
