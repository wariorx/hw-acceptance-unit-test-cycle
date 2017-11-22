=begin
require 'rails_helper'

describe MoviesController do
    describe 'Adding a Director to a Movie' do
        
        it 'calls the model method that allows you to add a director' do
            expect(Movie).to
                receive(:edit).with(3)
            get :edit, {:id => 3}
        end
        
        it 'fills in Director with "Ridley Scott" ' do
            Movie.stub(:edit)
            get :edit, {:id => 3}
            expect(response).to render_template('edit')
        end
        
        it 'adds the Director to the movie' do
        
        end
        
    end
    
end
=end