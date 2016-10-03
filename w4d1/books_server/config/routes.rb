





Rails.application.routes.draw do
  # =>      the name of the controller is books, and the name of the action is :index and :destroy
  resources :books, only: [:new, :create, :index, :destroy]
  # resources does all of this automatically for us
  # get books
end
