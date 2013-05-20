ActiveAdmin.register Company do

  filter :name
  filter :legal_name
  filter :cnpj

  actions :index, :show, :new, :create, :update, :edit

  index do
    selectable_column
    bcolumn :subscriber
    column :name
    column :legal_name
    default_actions
  end

  form do |f|
    f.inputs :details do
      f.input :name
      f.input :legal_name
      f.input :cnpj
      f.input :address
      f.input :subscriber, :as => :boolean
      f.input :users
      f.input :site
      f.input :logo
      f.input :headline
    end
    f.actions
  end
end
