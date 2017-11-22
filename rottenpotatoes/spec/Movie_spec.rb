require 'rails_helper'

describe Movie do
    
    it 'should find similar movies' do
        
        movie1 = Movie.create(:title => 'fake', :director => 'fake_director')
        movie2 = Movie.create(:title => 'fake2', :director => 'fake_director')
        
        result = Movie.similar_movies(movie1.id)
        expect(result).to eq([movie1,movie2])
    end
    
    it 'should not find similar movies when director is empty' do
        movie1 = Movie.create(:title => 'fake', :director => 'fake_director')
        movie2 = Movie.create(:title => 'fake2', :director => 'not_fake_director')
        
        result = Movie.similar_movies(movie1.id)
        
        expect(result).to eq([movie1]) 
    end
    
end