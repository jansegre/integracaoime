ActiveAdmin.register Resume do
  filter :user, collection: proc { User.students }

  form do |f|
    f.inputs "User Details" do
      f.input :user if f.object.new_record?
      f.input :references
      f.input :courses
    end
    f.actions
  end

  index do
    selectable_column
    column :user
    default_actions
  end
end
