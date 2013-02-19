ActiveAdmin.register Gallery do
  menu parent: "CMS"

  filter :title

  index do
    selectable_column
    column :title
    default_actions
  end

  show do |i|
    attributes_table do
      i.attribute_names.each do |a|
        row a
      end
      row :medias do
        for m in i.medias
          a href: m.image.url do
            image_tag(m.image.small.url)
          end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :page
      f.input :medias, :as => :select
    end
    f.actions
  end
end
