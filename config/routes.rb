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

  resources :pages do
    collection do
      get :youths
      get :childrens
      get :elders
      get :hospital
      get :food
      get :prison

      get :sunday
      get :tuesday
      get :thursday

      get :father
      get :son
      get :holy_spirit
    end
  end
  # get "contactpages/index"
  #
  # get "fatherpages/index"
  # get "sonpages/index"
  # get "holyspiritpages/index"
  #
  # get "sundaypages/index"
  # get "tuesdaypages/index"
  # get "thursdaypages/index"
  #
  # get "childrenpages/index"
  # get "youthpages/index"
  # get "elderpages/index"
  # get "hospitalpages/index"
  # get "prisonpages/index"
  # get "foodpages/index"
  resources :imagegalleries
  root to: "home#index"


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
