ActiveAdmin.register Page do

  filter :name
  filter :content
  filter :menu

  index do
    selectable_column
    column :name
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :content, :as => :text
    end
    f.actions
  end
end
