class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    puts"-------------------"
    puts @params
    puts @params.keys.count
    params.each_with_index do |file,idx|
      puts idx
      rows = file[1].split("\n")
      puts"_____________________"
      puts rows
      puts"_____________________"
      case file[0]
      when :dollar_format
        rows.each do |row|
          items = row.split(" $ ")
          puts "................................."
          puts items
        end
      # data = rows[0].split("&")
      #
      when :percent_format
        rows.each do |row|
          items = row.split(" % ")
          puts ":::::::::::::::::::::::::::::::::"
          puts items
        end
      # p data
      end
      puts"************************************"
    end
    puts"-------------------"

  end

  private

  attr_reader :params
end
