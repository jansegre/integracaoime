ActiveAdmin.register Logo do
  menu parent: "Dashboard"

  filter :name
  filter :active
  filter :is_sponsor

  index do
    selectable_column
    bcolumn :active
    bcolumn :is_sponsor
    column :name
    default_actions
  end

  show do |i|
    attributes_table do
      i.attribute_names.each do |a|
        row a unless a.starts_with? "image"
      end
      row :image_png do
        a href: i.image_png.url do
          image_tag(i.image_png.url)
        end
      end
      row :image_svg do
        a href: i.image_svg.url do
          image_tag(i.image_svg.url)
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :image_svg
      f.input :image_png
      f.input :name
      f.input :link
      f.input :width
      f.input :height
      f.input :is_sponsor, as: :boolean
      f.input :active, as: :boolean
    end
    f.actions
  end

  member_action :activate, :method => :put do
    logo = Logo.find(params[:id])
    logo.activate!
    if logo.save
      redirect_to({ action: "show" }, notice: t("flash.activated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end
end
