Rails.application.routes.draw do
  root to: "journalists#index"
  resources :journalists, only: [
  	:index,
  	:new,
  	:create,
  	:show,
  	:destroy,
  	:update,
    :edit]
end
