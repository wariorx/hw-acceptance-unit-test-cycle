Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  get 'movies/similar/:id', to: 'movies#similar', as: :similar_movies
  
  #root :director => redirect()
end