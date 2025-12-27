module ApplicationHelper
  def registration_edit_gender_avatar(user)
    unless user.gender == "F"
      "user/user-avatar-male-hover.svg"
    else
      "user/user-avatar-female-hover.svg"
    end
  end
end
