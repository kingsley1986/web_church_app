Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: {sessions: 'users/sessions'}

  get "homepages/show"
  get "contactpages/show"

  get "fatherpages/show"
  get "sonpages/show"
  get "holyspiritpages/show"

  get "sundaypages/show"
  get "tuesdaypages/show"
  get "thursdaypages/show"

  get "childrenpages/show"
  get "youthpages/show"
  get "elderpages/show"
  get "hospitalpages/show"
  get "prisonpages/show"
  get "foodpages/show"
  root to: "posts#index"

  resources :posts, shallow: true do
    resources :comments do
      resources :replies
    end
  end

end
