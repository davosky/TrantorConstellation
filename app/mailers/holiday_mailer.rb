class HolidayMailer < ApplicationMailer
  # default from: "trantorfoundation@cgil-fvg.net"
  default from: "trantor@fvg.cgil.it"

  def holiday_email
    @user = params[:user]
    @holiday = params[:holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Inserimento FERIE *",
    )
  end

  def holiday_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Cancellazione FERIE *",
    )
  end

  def holiday_email_update
    @user = params[:user]
    @holiday = params[:holiday]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_holidays.png"] = File.read("app/assets/images/mail_logo_holidays.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Modifica FERIE *",
    )
  end
end
