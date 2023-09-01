Rails.application.routes.draw do
  resources :users, only: [:index, :show], shallow: true do 
    resources :posts, only: [:index, :show]
  end

  shallow do
  scope '/post' do
    resources :comments, :likes
  end
end

  root "users#index"
end
