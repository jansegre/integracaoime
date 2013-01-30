ActiveAdmin.register Company do

  filter :name

  index do
    selectable_column
    column :name
    column :subscriber
    default_actions
  end

  form do |f|
    f.inputs :details do
      f.input :name
      f.input :subscriber, :as => :boolean
      f.input :users
    end
    f.actions
  end
end
