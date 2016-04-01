require 'spec_helper'

describe Movie do
    
    it 'has a method called same_director' do
        Movie.should respond_to(:same_director)
    end
    
    describe '#same_director' do
       
       it 'receives the director as a params' do
           Movie.should respond_to(:same_director).with(1).argument
       end
       
       it 'returns the set of movies having same director' do
           2.times do
              Movie.create({title: '', rating: '', director: 'abc', release_date: ''}) 
           end
           Movie.create({title: '', rating: '', director: 'ABC', release_date: ''})
           
           @movie = Movie.same_director('abc')
          # debugger
           @movie.should have(2).items   
       end
    end
    
end