Rails.application.routes.draw do
  devise_for :users
  root to: "links#index"
  resources :links do
    member do
      post 'like', to: 'links#upvote'
      post 'dislike', to: 'links#downvote'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
