Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount LetterOpenerWeb::Engine, at: '/letters' if Rails.env.development?

  namespace :api do
    namespace :auth do
      devise_for(
        :users,
        path: '',
        path_names: {
          sign_in: 'sign-in',
          sign_out: 'sign-out',
        },
        controllers: {
          sessions: 'api/auth/sessions'
        }
      )
    end
  end
end
