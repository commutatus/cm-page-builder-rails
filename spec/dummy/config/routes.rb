Rails.application.routes.draw do
  mount CmPageBuilder::Rails::Engine => "/cm_page_builder-rails"
  resources :test_containers
end
