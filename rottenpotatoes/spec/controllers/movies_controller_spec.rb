require 'spec_helper'

describe MoviesController do
    describe 'updating_director' do
        it 'should update director with value given' do
            Movie.should_receive(:update_attributes).with(:director)
        end
    end
     
end
