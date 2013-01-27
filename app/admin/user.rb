ActiveAdmin.register User do

  filter :email, :as => :string
  filter :name, :as => :string
  filter :approved, :as => :select

  index do
    selectable_column
    column :name
    column :email
    bcolumn :admin
    bcolumn :approved
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :approved, :as => :boolean
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
