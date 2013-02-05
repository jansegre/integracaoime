ActiveAdmin.register Calendar do

  filter :year
  filter :specialty

  index do
    selectable_column
    column :year
    column :specialty
    default_actions
  end
end
