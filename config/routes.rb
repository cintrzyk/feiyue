Feiyue::Application.routes.draw do

  mount Spree::Core::Engine, at: '/'

  Spree::Core::Engine.routes.draw do
    post 'contact', to: 'contacts#create'
    get 'contact', to: 'contacts#new', as: :new_contact
    post 'products/:id/:amount/:email', to: 'products#ask', as: :ask_price
    get 'news', to: 'posts#index', as: :posts
    get 'news/:id', to: 'posts#show', as: :post
    get 'profit', to: 'home#profit', as: :profit
    get 'about', to: 'home#about', as: :about
    get 'faq', to: 'home#faq', as: :faq
    get 'thank_u', to: 'home#thank_u', as: :thank_u

    namespace :admin do
      resources :posts do
        member do
          post 'images', to: 'posts#create_image', as: :create_image
          delete 'images/:image_id', to: 'posts#destroy_image', as: :destroy_image
        end
      end

      resources :contacts, only: [:index, :destroy, :show]
    end
  end
end
