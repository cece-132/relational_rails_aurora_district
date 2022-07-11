require 'rails_helper'

RSpec.describe Teacher, type: :model do
    describe 'relationships' do
        it {should belong_to(:daycare)}
    end
end