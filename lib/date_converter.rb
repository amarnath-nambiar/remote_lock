class DateConverter

  def self.normalize_date(date)
    splitted_date = date.split("-")
    if splitted_date[0].to_i > 31 # if greater than 31 its the year value
      "#{splitted_date[1].to_i}/#{splitted_date[2].to_i}/#{splitted_date[0]}"
    elsif splitted_date[2].to_i > 31
      "#{splitted_date[1].to_i}/#{splitted_date[0].to_i}/#{splitted_date[2]}"
    else
      "unexpected date format"
    end
  end

end
