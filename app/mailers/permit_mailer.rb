class PermitMailer < ApplicationMailer
  default from: "trantor@fvg.cgil.it"

  def permit_email
    @user = params[:user]
    @permit = params[:permit]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_permits.png"] = File.read("app/assets/images/mail_logo_permits.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Inserimento PERMESSI *",
    )
  end

  def permit_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_permits.png"] = File.read("app/assets/images/mail_logo_permits.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Cancellazione PERMESSI *",
    )
  end

  def permit_email_update
    @user = params[:user]
    @permit = params[:permit]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_permits.png"] = File.read("app/assets/images/mail_logo_permits.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Modifica PERMESSI *",
    )
  end
end
