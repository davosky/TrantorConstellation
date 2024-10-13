class DiseaseMailer < ApplicationMailer
  default from: "trantor@fvg.cgil.it"

  def disease_email
    @user = params[:user]
    @disease = params[:disease]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_diseases.png"] = File.read("app/assets/images/mail_logo_diseases.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Inserimento MALATTIA *",
    )
  end

  def disease_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_diseases.png"] = File.read("app/assets/images/mail_logo_diseases.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Cancellazione MALATTIA *",
    )
  end

  def disease_email_update
    @user = params[:user]
    @disease = params[:disease]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_diseases.png"] = File.read("app/assets/images/mail_logo_diseases.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Modifica MALATTIA *",
    )
  end
end
