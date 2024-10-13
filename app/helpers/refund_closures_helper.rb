module RefundClosuresHelper
  def payed_fg?(refund_closure)
    if refund_closure.payed == true
      "fg-payed"
    else
      "fg-unpayed"
    end
  end
end
