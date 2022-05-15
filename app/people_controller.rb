require 'date_converter'
require 'city_translation'
class PeopleController

  def initialize(params)
    @params = params
    @cities = CityTranslation.new.cities
  end

  def normalize
    result = []
    params.each do |file|
      break if file[0] == :order
      rows = file[1].split("\n")
      data_hash = prepare_data_hash(file[0], rows)
      result << get_resultant_array(data_hash)
    end

    result.flatten!.sort!
  end

  private

  def prepare_data_hash(delimiter, rows)
    case delimiter
    when :dollar_format
      keys = rows.first.split(" $ ")
    when :percent_format
      keys = rows.first.split(" % ")
    end

    data_hash = {}
    rows.each_with_index do |row,i|
      hash={}
      next if i==0 # first row is for the keys

      case delimiter
      when :dollar_format
        items = row.split(" $ ")
      when :percent_format
        items = row.split(" % ")
      end
      items.each_with_index do |item,x|
        hash[keys[x]]=item
      end
      data_hash[i] = hash
    end

    data_hash
  end

  def get_resultant_array(data_hash)
    result = []
    arr = []
    data_hash.each do |key, val|
      arr[key-1] = [val["first_name"], cities[val["city"]], DateConverter.normalize_date(val["birthdate"])]
    end
    array = arr.map{|ar| ar.join(", ")}

    result<<array
  end

  attr_reader :params, :cities
end
