Rails.application.routes.draw do
  resources :members
  devise_for :users
  resources :groups do
    member do
      put "like", to:"groups#upvote"
      put "dislike", to:"groups#downvote"
    end
    resources :members
  end
  root to: "groups#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
