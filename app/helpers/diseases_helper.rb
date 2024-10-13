module DiseasesHelper
  def disease_full_user(disease)
    "#{disease.user.first_name} #{disease.user.last_name}"
  end

  def disease_duration(disease)
    @sweeknumber = disease.start_time.cweek.to_i()
    @eweeknumber = disease.end_time.cweek.to_i()
    @period = @eweeknumber - @sweeknumber

    if @period < 1
      @timeamount = TimeDifference.between(disease.start_time, disease.end_time).in_days
      @timeamount = @timeamount + 1
    else
      @timeamount = TimeDifference.between(disease.start_time, disease.end_time).in_days
      @timeamount = @timeamount - ((@period * 2) - 1)
    end
  end

  def disease_range(disease)
    Date.today >= disease.start_time && Date.today <= disease.end_time
  end

  def startdisease(disease)
    disease.start_time
  end

  def enddisease(disease)
    disease.end_time
  end

  def processed_disease(disease)
    disease.processed == true
  end
end
