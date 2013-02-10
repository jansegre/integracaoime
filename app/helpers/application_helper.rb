module ApplicationHelper
  def devise_user
    Devise::mappings[:user]
  end

  def current_company
    current_user.company
  end
end
