require 'spec_helper'
require 'rails_helper'

describe MoviesController do
    
    before :each do
        @fake_movie = double('movie',:id => '1')
        @more_fake_movies = double('movies')
        allow(@fake_movie).to receive(:director) {'Some Name'}
        Movie.should_receive(:find).and_return(@fake_movie)
 #       allow(Movie).to receive(:find).with(@fake_movie.id) {@fake_movies}
        allow(Movie).to receive(:same_director).with('Some Name') {@more_fake_movies}
    end

   describe '#similar' do
    
        it 'gets the requested movie info to the view'  do
            post :similar, {:id => '1'}
            response.status.should be(200)
            assigns(:movie).should eql(@fake_movie)
        end
        
        #Happy path: movie has director info
        it 'calls the model method to return the movies with same director' do
            expect(Movie.same_director('Some Name')).to eq(@more_fake_movies)
            post :similar, {:id => '1'}
            response.status.should be(200)
        end
        
        it 'sets the similar movies info to the view'   do
            post :similar, {:id => '1'}
            assigns(:movies).should eql(@more_fake_movies)
        end
        
        #Sad path: movie does not have director info
        it 'redirect to the index page'   do
            @fake_movie.should_receive(:director).and_return(nil)
            @fake_movie.should_receive(:title).and_return('Some Name')
            post :similar, {:id => '1'}
            response.should redirect_to movies_path
        end
        
        it 'sets a notice saying the movies has no director info'   do
            @fake_movie.should_receive(:director).and_return(nil)
            @fake_movie.should_receive(:title).and_return('Some Name')
            post :similar, {:id => '1'}
            flash[:notice].should eql("'Some Name' has no director info")
        end

        
   end
    
end