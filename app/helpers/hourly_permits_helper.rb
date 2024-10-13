module HourlyPermitsHelper
  def hourly_permit_full_user(hourly_permit)
    "#{hourly_permit.user.first_name} #{hourly_permit.user.last_name}"
  end

  def hourly_permit_duration(hourly_permit)
    @timeamount = TimeDifference.between(hourly_permit.start_time, hourly_permit.end_time).in_hours
  end

  def processed_hourly_permit(hourly_permit)
    hourly_permit.processed == true
  end
end
