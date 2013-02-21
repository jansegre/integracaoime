ActiveAdmin.register Video do
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
        row a unless a == "video"
      end
      row :video do
        a href: i.video do
          raw(i.video)
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :video
      f.input :gallery, :as => :select
    end
    f.actions
  end
end
