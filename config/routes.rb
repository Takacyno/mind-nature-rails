Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/patients/:id/frontCover', to: 'patients#frontCover' ,as: :frontCover_patient
  get '/admin/:id/frontCover', to: 'admin#frontCover' ,as: :frontCover_admin
  get '/counsellors/:id/frontCover', to: 'counsellors#frontCover' ,as: :frontCover_counsellor
  
  namespace :admin do
    resources :admin
  end

  resources :patients do
    resources :addicdata
    resources :addicdata do
      resources :diaries
      resource :essay
      resources :essayreads
      resources :imaginationtexts
      resources :pseudoacts
      resources :controlstimulus
      resources :imaginationtexts do
        resources :imaginations
      end
    end
    resources :funeventabstracts
    resources :funeventconcretes,only: [:index,:create]
    resources :funeventreads,only: [:index,:create]
    get '/funeventreads/select', to: 'funeventreads#select' ,as: :select_funeventread
    resources :funeventabstracts do
      resources :funeventconcretes,except: [:index,:create]
      resources :funeventreads,except: [:index,:create]
    end

  end
  
  root to: 'sessions#new'
  resources :users
  resources :counsellors
  resources :patients
end

