Rails.application.routes.draw do

  namespace :rails_taggable do
    resources :tags
  end

end