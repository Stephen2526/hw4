require 'spec_helper'

=begin
describe MoviesController do
    describe 'updating_director' do
        it 'should update director with value given' do
            Movie.should_receive(:update_attributes).with(:director)
        end
    end
end
=end

describe MoviesController do
   describe '#similar' do
        it 'gets the requested movie info to the view'   do
            skip
        end
        
        #Happy path: movie has director info
        it 'calls the modle method to return the movies with same director'   do
            
        end
        
        it 'sets the similar movies info to the view'   do
            
        end
        
        #Sad path: movie does not have director info
        it 'redirect to the index page'   do
            
        end
        
        it 'sets a notice saying the movies has no director info'   do
            
        end

        
   end
    
end