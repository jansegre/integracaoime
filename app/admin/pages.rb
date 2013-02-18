ActiveAdmin.register Page do
  menu parent: "CMS"

  filter :name
  filter :content
  filter :menu

  index do
    selectable_column
    column :name
    default_actions
  end

  show do |i|
    attributes_table do
      i.attribute_names.each do |a|
        row a unless a == "content"
      end
      row :content do
        raw(i.content)
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :content, :as => :text
    end
    f.actions
  end
end
