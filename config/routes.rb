Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: [:new, :create] do
    end
  end

  resources :plants, only: :destroy do
    resources :plant_tags, only: [:new, :create]
  end



end
