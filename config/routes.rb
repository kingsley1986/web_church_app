Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config.merge({
     controllers: {sessions: 'users/sessions'},
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
    }
  })

  get "homepages/index"
  get "contactpages/index"

  get "fatherpages/index"
  get "sonpages/index"
  get "holyspiritpages/index"

  get "sundaypages/index"
  get "tuesdaypages/index"
  get "thursdaypages/index"

  get "childrenpages/index"
  get "youthpages/index"
  get "elderpages/index"
  get "hospitalpages/index"
  get "prisonpages/index"
  get "foodpages/index"
  root to: "homepages#index"


  resources :posts, :pictures, :aboutpages, shallow: true do
    resources :pictures
      member do
        post 'like'
        delete "unlike"
      end
      resources :comments do
        member do
          post 'like'
          delete "unlike"
        end
      resources :replies
    end
  end
end
