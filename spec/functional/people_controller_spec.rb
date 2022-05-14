require 'spec_helper'
RSpec.describe PeopleController do

  describe '#get_resultant_array' do
    context 'when get_resultant_array is called with a valid data hash' do
      let(:data_hash) {{1=>{"city"=>"LA", "birthdate"=>"30-4-1974", "last_name"=>"Nolan", "first_name"=>"Rhiannon"},
                        2=>{"city"=>"NYC", "birthdate"=>"5-1-1962", "last_name"=>"Bruen", "first_name"=>"Rigoberto"}}}
      let(:resultant_array) {[["Rhiannon, Los Angeles, 4/30/1974", "Rigoberto, New York City, 1/5/1962"]]}

      it 'should return a 2D array of data hash' do
        expect(PeopleController.new(nil).send(:get_resultant_array, data_hash)).to eq(resultant_array)
      end
    end

  end
end

