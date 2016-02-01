class DestinyUtility

  def self.reset_start_date
    return Date.today if Date.today.tuesday? 
    for x in (Date.today-7)..(Date.today)
      return x if x.tuesday?
    end
  end

  def self.next_reset_start_date
    DestinyUtility.reset_start_date + 7
  end

end