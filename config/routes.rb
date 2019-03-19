Rails.application.routes.draw do
  root to: 'homes#index'

  resources :repositories, only: [] do
    collection do
      get :public
      post :public
    end
  end
end
