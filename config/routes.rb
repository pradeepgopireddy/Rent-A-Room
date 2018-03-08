Rails.application.routes.draw do
	resources :reviews
	delete "bookings/cancel_booking"
	get "bookings/unconfirmed_bookings"
	resources :bookings
	get "rooms/my_rooms"
	get "rooms/unauthorized_rooms"
	resources :rooms do
		resources :special_prices
	end
  devise_for :users
  get "amenities/check_name_present"
  resources :amenities
  get "/cities/check_name_present"
  resources :cities
  root "rooms#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
