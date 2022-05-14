require 'spec_helper'
RSpec.describe DateConverter do

  describe '#normalize_date' do

    context 'when date format is yyyy-mm-dd' do
      let(:date1) { "1986-05-29" }
      it 'should return date in mm/dd/yyyy format' do
        expect(DateConverter.normalize_date(date1)).to eq("5/29/1986")
      end
    end

    context 'when date format is dd-mm-yyyy' do
      let(:date2) { "30-4-1974" }
      it 'should return date in mm/dd/yyyy format' do
        expect(DateConverter.normalize_date(date2)).to eq("4/30/1974")
      end
    end

  end
end