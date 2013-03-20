module ApplicationHelper
  def devise_user
    Devise::mappings[:user]
  end

  def current_company
    current_user.company
  end

  def url_for_page page
    url_for(page_path(page.slug))
  end
end
