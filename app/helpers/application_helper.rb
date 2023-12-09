module ApplicationHelper
  def navbar_content(controller)
    case controller
    when "home"
      "shared/navbar_content_home"
    when "veichles"
      "shared/navbar_content_veichles"
    when "transports"
      "shared/navbar_content_transports"
    when "mission_paths"
      "shared/navbar_content_mission_paths"
    when "mission_places"
      "shared/navbar_content_mission_places"
    when "mission_reasons"
      "shared/navbar_content_mission_reasons"
    when "mission_structures"
      "shared/navbar_content_mission_structures"
    else
      "shared/navbar_content_generic"
    end
  end

  def admin
    current_operator.admin == true
  end
end
