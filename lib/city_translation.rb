require 'yaml'
class CityTranslation
  attr_accessor :cities

  def initialize
    @cities = YAML.load_file('lib/cities.yml')
  end

end
