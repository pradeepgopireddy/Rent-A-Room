Rails.application.routes.draw do
	resources :reviews
	get "bookings/cancel_booking"
	get "bookings/unconfirmed_bookings"
	resources :bookings
	get "rooms/my_rooms"
	get "rooms/unauthorized_rooms"
	resources :rooms do
		resources :special_prices
	end
  devise_for :users
  resources :amenities
  resources :cities
  root "rooms#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
