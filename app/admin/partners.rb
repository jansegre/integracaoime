ActiveAdmin.register Partner do
  menu parent: "Dashboard"

  filter :name

  index do
    selectable_column
    bcolumn :active
    column :name
    column :link
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :link
      f.input :active, as: :boolean
    end
    f.actions
  end

  member_action :activate, :method => :put do
    partner = Partner.find(params[:id])
    partner.activate!
    if partner.save
      redirect_to({ action: "show" }, notice: t("flash.activated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  member_action :deactivate, :method => :put do
    partner = Partner.find(params[:id])
    partner.deactivate!
    if partner.save
      redirect_to({ action: "show" }, notice: t("flash.deactivated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  action_item :only => :show, :if => ->{ not partner.active } do
    link_to t(".activate"), { action: "activate" }, method: "put"
  end

  action_item :only => :show, :if => ->{ partner.active } do
    link_to t(".deactivate"), { action: "deactivate" }, method: "put"
  end

  #TODO optimize, so it only hits mongo once or twice
  batch_action :activate_selected do |selection|
    Partner.find(selection).each do |p|
      p.activate!
      p.save
    end
    redirect_to({ action: "index" }, notice: t("flash.activated_selected"))
  end

  batch_action :deactivate_selected do |selection|
    Partner.find(selection).each do |p|
      p.deactivate!
      p.save
    end
    redirect_to({ action: "index" }, notice: t("flash.deactivated_selected"))
  end
end
