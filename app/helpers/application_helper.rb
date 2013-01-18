module ApplicationHelper
  def devise_user
    Devise::mappings[:user]
  end
end
