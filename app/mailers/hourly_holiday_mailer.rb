class HourlyHolidayMailer < ApplicationMailer
  default from: "trantor@fvg.cgil.it"

  def hourly_holiday_email
    @user = params[:user]
    @hourly_holiday = params[:hourly_holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_hourly_holidays.png"] = File.read("app/assets/images/mail_logo_hourly_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Inserimento ORE FERIE *",
    )
  end

  def hourly_holiday_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_hourly_holidays.png"] = File.read("app/assets/images/mail_logo_hourly_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Cancellazione ORE FERIE *",
    )
  end

  def hourly_holiday_email_update
    @user = params[:user]
    @hourly_holiday = params[:hourly_holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_hourly_holidays.png"] = File.read("app/assets/images/mail_logo_hourly_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Modifica ORE FERIE *",
    )
  end
end
