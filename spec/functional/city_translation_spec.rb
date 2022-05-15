require 'spec_helper'
RSpec.describe CityTranslation do

  describe '#ititialize cities' do

    context 'when cities attribute is called with a city shot-form' do
      it 'should return the full-form of the city' do
        expect(CityTranslation.new.cities["LA"]).to eq("Los Angeles")
      end
    end
  end

end
