Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/show'
  get 'comments/edit'
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
