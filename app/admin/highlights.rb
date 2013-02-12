ActiveAdmin.register Highlight do

  filter :description
  filter :company_id

  index do
    selectable_column
    column :description
    column :company
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :image
      f.input :description, :as => :text
    end
    f.actions
  end
end
