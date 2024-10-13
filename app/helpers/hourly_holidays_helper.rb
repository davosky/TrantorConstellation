module HourlyHolidaysHelper
  def hourly_holiday_full_user(hourly_holiday)
    "#{hourly_holiday.user.first_name} #{hourly_holiday.user.last_name}"
  end

  def hourly_holiday_duration(hourly_holiday)
    @timeamount = TimeDifference.between(hourly_holiday.start_time, hourly_holiday.end_time).in_hours
  end

  def processed_hourly_holiday(hourly_holiday)
    hourly_holiday.processed == true
  end
end
