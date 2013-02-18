ActiveAdmin.register Image do
  menu parent: "CMS"

  filter :title

  index do
    selectable_column
    column :title
    column :description
    default_actions
  end

  show do |i|
    attributes_table do
      i.attribute_names.each do |a|
        row a unless a == "image"
      end
      row :image do
        a href: i.image.url do
          image_tag(i.image.thumb.url)
        end
      end
    end
    active_admin_comments
  end
end
