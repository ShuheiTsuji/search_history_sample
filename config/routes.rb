Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'
  resource :sample1_users, only: %i[show]
  resource :sample2_users, only: %i[show]
  resource :sample3_users, only: %i[show]
  resource :sample4_users, only: %i[show]
end
