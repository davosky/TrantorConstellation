module PermitsHelper
  def permit_full_user(permit)
    "#{permit.user.first_name} #{permit.user.last_name}"
  end

  def permit_duration(permit)
    @sweeknumber = permit.start_time.cweek.to_i()
    @eweeknumber = permit.end_time.cweek.to_i()
    @period = @eweeknumber - @sweeknumber

    if @period < 1
      @timeamount = TimeDifference.between(permit.start_time, permit.end_time).in_days
      @timeamount = @timeamount + 1
    else
      @timeamount = TimeDifference.between(permit.start_time, permit.end_time).in_days
      @timeamount = @timeamount - ((@period * 2) - 1)
    end
  end

  def permit_range(permit)
    Date.today >= permit.start_time && Date.today <= permit.end_time
  end

  def startpermit(permit)
    permit.start_time
  end

  def endpermit(permit)
    permit.end_time
  end

  def processed_permit(permit)
    permit.processed == true
  end
end
