Rails.application.routes.draw do
  
  devise_for :users
  
  resources :posts do
  	member do 
  		put "like" => "posts#upvote"
  		put "unlike" => "posts#downvote"
			end
		end

		resources :posts do 
			resources :comments 
		end 

  root "posts#index"

end
