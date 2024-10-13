class HourlyPermitMailer < ApplicationMailer
  default from: "trantor@fvg.cgil.it"

  def hourly_permit_email
    @user = params[:user]
    @hourly_permit = params[:hourly_permit]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_hourly_permits.png"] = File.read("app/assets/images/mail_logo_hourly_permits.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Inserimento ORE PERMESSO *",
    )
  end

  def hourly_permit_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_hourly_permits.png"] = File.read("app/assets/images/mail_logo_hourly_permits.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Cancellazione ORE PERMESSO *",
    )
  end

  def hourly_permit_email_update
    @user = params[:user]
    @hourly_permit = params[:hourly_permit]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_hourly_permits.png"] = File.read("app/assets/images/mail_logo_hourly_permits.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Modifica ORE PERMESSO *",
    )
  end
end
