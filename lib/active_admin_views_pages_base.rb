# lib/active_admin_views_pages_base.rb
class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document
  private
  # Renders the content for the footer
  def build_footer
    div :id => "footer" do
      para raw I18n.translate :developed_by
      para "&copy; #{Date.today.year.to_s} #{link_to('IntegracaoIME', root_path)}".html_safe
    end
  end
end
