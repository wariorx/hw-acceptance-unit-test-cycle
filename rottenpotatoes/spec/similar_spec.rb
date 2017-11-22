require 'rails_helper'

FactoryGirl.define do
  factory :movie do
    title 'Star Wars' 
    director 'George Lucas'
  end
end

describe MoviesController, :type => :controller do
    describe 'Clicking on the Similar Movies link' do
    before :each do 
        @fake_movies = [double('Movie'), double('Movie')]
       # @fake_movie = FactoryGirl.create(:movie, :id => 1, :title => "Star Wars", :director => "George Lucas")
    end
        it 'calls the model method through a RESTful route' do
            #fakes = [double('movie1'), double('movie2')]
            #@fake_movie = FactoryGirl.create(:movie, :id => 1, :title => "Star Wars", :director => "George Lucas")
            #@fake_movie2 = FactoryGirl.create(:movie, :id => 2, :title => "Star Wars", :director => "George Lucas")
            #expect(Movie).to receive(:similar_movies).with("#{@fake_movie.id}")#.and_return(fakes)
            #get(:similar, {:id => '1'}) #"#{@fake_movie.id}"})
            #Movie.should_receive(:find_by_id).with("1").and_return(@fake_movie)
            #Movie.should_receive(:similar_movies).with("#{@fake_movie.id}").and_return(@fake_movies)
            #byebug
            movie1 = Movie.create(:title => 'fake', :director => 'fake_director')
            movie2 = Movie.create(:title => 'fake2', :director => 'fake_director')
            #byebug
            #movie2 = Movie.create(:title => 'fake2', :director => 'fake_director')
            get(:similar, {:id => "#{movie1.id}"}) #"#{@fake_movie.id}"})
            
            #Movie.should_receive(:find_by_id).with("#{movie1.id}").and_return(@fake_movie)
            #byebug
        end
        
        it 'when the specified movie has a director, it should render the similar page' do
            #@fake_movie = FactoryGirl.create(:movie, :id => 2, :title => "Star Wars", :director => "George Lucas")
            #Movie.stub(:similar_movies)
            movie1 = Movie.create(:title => 'fake', :director => 'fake_director')
            movie2 = Movie.create(:title => 'fake2', :director => 'fake_director')
            get :similar, {:id => "#{movie1.id}"}#"#{@fake_movie2.id}"}
            expect(response).to render_template('similar')
        end
=begin
        it 'when the specified movie does NOT have a director, it should render the home page' do
           #Movie.stub(:similar_movies)
           #@fake_movie = FactoryGirl.create(:movie, :id => 3, :title => "Fake", :director => "")
           movie = Movie.create(:title => 'fake', :director => '')
            get :similar, {:id => "#{movie.id}"}
            expect(response).to render_template('index')
        end
=end      
        #it 'has a model method to render the similar movies' do
         #   fakes = [mock(movie1), mock(movie2)]
          #  expect(Movie).to receive(:similar).with('1').and_return(fakes)
           # expect(assigns(:similar_movies).to_eq(fakes))
        
    end
    
    describe 'clickin on the add director' do
    
        it 'allows you to add a director' do
           movie1 = Movie.create(:title => 'fake', :director => '')
           
          get :edit, {:id => "#{movie1.id}"}
          
          
           
           
        end
    end
    describe 'other stuff' do
        it 'renders the home page' do
            get :index
            expect(response).to render_template('index')
        end
        
        it 'displays the selected movie' do
            movie = Movie.create(:title => 'fake', :director => 'fake_director')
            #byebug
            get :show, {:id => movie.id}
            
            expect(response).to render_template('movies/show')
        end

    end
end