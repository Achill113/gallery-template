Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :gallery do
    collection do
      post 'upload'
    end
  end

  get '/gallery/:id/display', to: "gallery#display", as: "secure_image_display"
end
