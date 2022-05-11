class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    main_array=[]
    params.each_with_index do |file,idx|
      break if idx==2
      puts idx
      rows = file[1].split("\n")
      case file[0]
      when :dollar_format
        keys = rows.first.split(" $ ")
      when :percent_format
        keys = rows.first.split(" % ")
      end
      data_hash={}
      rows.each_with_index do |row,i|
        hash={}
        next if i==0

        case file[0]
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
      arr=[]
      data_hash.each do |key, val|
          arr[key-1]=[val["first_name"], val["city"], val["birthdate"]]
      end
      # arr.sort!
      array= arr.map{|ar| ar.join(", ")}
      # puts array.inspect
      main_array<<array
      puts"************************************"
    end
    # main_array.sort!
    xrr = main_array.map{|ar| ar.join(", ")}
    puts"-------#{xrr.sort}------------"

  end

  private

  attr_reader :params
end
