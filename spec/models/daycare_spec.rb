require 'rails_helper'

RSpec.describe Daycare, type: :model do
    describe 'relationships' do
        it {should have_many(:teachers)}
    end
end