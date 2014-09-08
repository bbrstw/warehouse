module UserHelper
  def user_auth_status(user)
    if current_account.user == user
      content_tag(:span, '', class: 'fa fa-check color-success')
    else
      'Invitation Pending'
    end
  end
end