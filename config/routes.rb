

CmPageBuilder::Rails::Engine.routes.draw do
  # Only individual items can be shown and edited.
  # The only way to access these is through their parent record in the main application, so no index
  # Their lifecycle is also associated with their parent record's, so no create and destroy
  resources :pages, only: [:show, :edit, :update]
end
