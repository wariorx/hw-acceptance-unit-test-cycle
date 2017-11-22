class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.similar_movies id
    movie_director = Movie.find(id)[:director]
    movie_director != '' ? Movie.where(director: movie_director) : Movie.where(id: id)
    #byebug
  end
  
end
