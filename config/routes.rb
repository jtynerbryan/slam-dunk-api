Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/get_highlights", to: 'highlights#get_highlights'
      get "/update_highlights", to: 'highlights#update_highlights'
    end
  end

end
