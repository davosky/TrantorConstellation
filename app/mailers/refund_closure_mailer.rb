class RefundClosureMailer < ApplicationMailer
  default from: "trantor@fvg.cgil.it"

  def refund_closure_email
    @user = params[:user]
    @refund_closure = params[:refund_closure]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_refund_closures.png"] = File.read("app/assets/images/mail_logo_refund_closures.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Inserimento CHIUSURE RIMBORSI *",
    )
  end

  def refund_closure_email_destroy
    @user = params[:user]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_refund_closures.png"] = File.read("app/assets/images/mail_logo_refund_closures.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Cancellazione CHIUSURE RIMBORSI *",
    )
  end

  def refund_closure_email_update
    @user = params[:user]
    @refund_closure = params[:refund_closure]
    @greeting = "TrantorFoundation"
    attachments["mail_logo.png"] = File.read("app/assets/images/mail_logo.png")
    attachments["mail_logo_refund_closures.png"] = File.read("app/assets/images/mail_logo_refund_closures.png")
    @managers = User.where(province: @user.province, region: @user.region, manager: true)
    emails = @managers.collect(&:email).join(",")
    mail(
      from: "TrantorFoundation <trantor@fvg.cgil.it>",
      to: emails,
      subject: "TrantorFoundation CGIL FVG  * Modifica CHIUSURE RIMBORSI *",
    )
  end
end
