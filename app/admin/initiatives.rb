ActiveAdmin.register Initiative do

  filter :name

  index do
    selectable_column
    column :name
    column :site
    default_actions
  end
end
