module HolidaysHelper
  def holiday_full_user(holiday)
    "#{holiday.user.first_name} #{holiday.user.last_name}"
  end

  def holiday_duration(holiday)
    @sweeknumber = holiday.start_time.cweek.to_i()
    @eweeknumber = holiday.end_time.cweek.to_i()
    @period = @eweeknumber - @sweeknumber

    if @period < 1
      @timeamount = TimeDifference.between(holiday.start_time, holiday.end_time).in_days
      @timeamount = @timeamount + 1
    else
      @timeamount = TimeDifference.between(holiday.start_time, holiday.end_time).in_days
      @timeamount = @timeamount - ((@period * 2) - 1)
    end
  end

  def holiday_range(holiday)
    Date.today >= holiday.start_time && Date.today <= holiday.end_time
  end

  def startholiday(holiday)
    holiday.start_time
  end

  def endholiday(holiday)
    holiday.end_time
  end

  def processed_holiday(holiday)
    holiday.processed == true
  end
end
