module ApplicationHelper
  def navbar_content(controller)
    case controller
    when "home"
      "shared/navbar_content_home"
    when "veichles"
      "shared/navbar_content_veichles"
    else
      "shared/navbar_content_generic"
    end
  end

  def admin
    current_operator.admin == true
  end
end
