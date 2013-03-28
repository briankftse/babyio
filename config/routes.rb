Babyio::Application.routes.draw do
  match "/settings/account" => "settings#account", :as => :settings_account
  match "/settings/password" => "settings#password", :as => :settings_password
  match "/settings/applications" => "settings#apps", :as => :settings_apps

  devise_for :users,
    :controllers => {
      :registrations => "users/registrations",
      :omniauth_callbacks => "users/omniauth_callbacks"
    }

  match "/users/:id" => "users#show", :via => :get, :as => :user

  resources :users do
    resources :babies, :except => :show
  end
  match ":username" => "babies#show", :via => :get, :as => :baby

  scope ":username" do
    resources :posts
  end

  root :to => "home#landing"
end
