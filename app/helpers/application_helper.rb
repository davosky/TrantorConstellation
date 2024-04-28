module ApplicationHelper
  def full_user
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def navbar_icon
    case
    when current_page?(root_path)
      "navbar/home-icon".html_safe
    when current_page?(edit_user_registration_path)
      "navbar/user-edit-icon".html_safe
    when current_page?(home_credits_path)
      "navbar/credits-icon".html_safe
    else
      "navbar/page-icon".html_safe
    end
  end

  def navbar_title
    case
    when current_page?(root_path)
      t "root_path".html_safe
    when current_page?(edit_user_registration_path)
      t "user_edit_path".html_safe
    when current_page?(home_credits_path)
      t "home_credits_path".html_safe
    else
      t "generic_path".html_safe
    end
  end
end
