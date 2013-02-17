ActiveAdmin.register Menu do

  filter :title

  index do
    selectable_column
    bcolumn :active
    column :slug
    column :title
    column :parent
    default_actions
  end

  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :parent
      end
      f.input :title
      f.input :slug
      f.input :active, :as => :boolean
    end
    f.actions
  end

  member_action :activate, :method => :put do
    menu = Menu.find(params[:id])
    menu.activate!
    if menu.save
      redirect_to({ action: "show" }, notice: t("flash.activated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  member_action :deactivate, :method => :put do
    menu = Menu.find(params[:id])
    menu.deactivate!
    if menu.save
      redirect_to({ action: "show" }, notice: t("flash.deactivated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  action_item :only => :show, :if => ->{ not resource.active? } do
    link_to t(".activate"), { action: "activate" }, method: "put"
  end

  action_item :only => :show, :if => ->{ resource.active? } do
    link_to t(".deactivate"), { action: "deactivate" }, method: "put"
  end

  #TODO optimize, so it only hits mongo once or twice
  batch_action :activate_selected do |selection|
    Menu.find(selection).each do |m|
      m.activate!
      m.save
    end
    redirect_to({ action: "index" }, notice: t("flash.activated_selected"))
  end

  batch_action :deactivate_selected do |selection|
    Menu.find(selection).each do |m|
      m.deactivate!
      m.save
    end
    redirect_to({ action: "index" }, notice: t("flash.deactivated_selected"))
  end
end
