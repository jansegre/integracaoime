ActiveAdmin.register Image do

  filter :title

  index do
    selectable_column
    column :title
    column :image
    default_actions
  end

  show do |i|
    attributes_table do
      i.attribute_names.each do |a|
        row a
      end
      row :image do
        image_tag(i.image.thumb.url)
      end
    end
    active_admin_comments
  end
end
