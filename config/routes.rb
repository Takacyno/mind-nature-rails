Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/frontCoverPatient', to: 'patients#frontCover' ,as: :frontCover_patient
  get '/frontCoverAdmin', to: 'admin#frontCover' ,as: :frontCover_admin
  get '/frontCoverCounsellor', to: 'counsellors#frontCover' ,as: :frontCover_counsellor
  
  namespace :admin do
    resources :admin
  end
  namespace :counsellors do
    get '/showPOVCounsellor', to: 'patients#show_counsellor' ,as: :show_counsellor
    get '/editPOVCounsellor', to: 'patients#edit_counsellor' ,as: :edit_counsellor
  end
  resources :patients do
    resources :addicdata
  end
  root to: 'sessions#new'
  resources :users
  resources :counsellors
  resources :patients
end
