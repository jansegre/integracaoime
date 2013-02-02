ActiveAdmin.register Resume do
  filter :user

  form do |f|
    f.inputs "User Details" do
      f.input :user
    end
    f.actions
  end

  index do
    selectable_column
    column :user
    default_actions
  end
end
