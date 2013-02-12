ActiveAdmin.register Highlight do

  filter :description
  filter :company_id

  index do
    selectable_column
    column :description
    column :company
    default_actions
  end
end
