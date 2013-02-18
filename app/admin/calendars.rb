ActiveAdmin.register Calendar do
  menu parent: "Dashboard"

  filter :year
  filter :specialty

  index do
    selectable_column
    column :year
    column :specialty
    default_actions
  end
end
