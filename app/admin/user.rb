ActiveAdmin.register User do

  filter :email
  filter :name
  filter :approved

  index do
    selectable_column
    column :name
    column :email
    column :approved
    column :current_sign_in_at
    #column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :approved
      # let devise do its thing
      #f.input :password
      #f.input :password_confirmation
    end
    f.actions
  end

  batch_action :approve do |selection|
    selected = User.find(selection)
    User.transaction do
      selected.each do |u|
        u.approved = true
        u.save
      end
    end
  end
end
