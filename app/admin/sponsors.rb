ActiveAdmin.register Sponsor do

  filter :title
  filter :content

  index do
    selectable_column
    bcolumn :active
    column :title
    column :link
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :image
      f.input :title
      f.input :content, :as => :text
      f.input :link
      f.input :active, :as => :boolean
    end
    f.actions
  end

  member_action :activate, :method => :put do
    sponsor = Sponsor.find(params[:id])
    sponsor.activate!
    if sponsor.save
      redirect_to({ action: "show" }, notice: t("flash.activated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  member_action :deactivate, :method => :put do
    sponsor = Sponsor.find(params[:id])
    sponsor.deactivate!
    if sponsor.save
      redirect_to({ action: "show" }, notice: t("flash.deactivated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  action_item :only => :show, :if => ->{ not sponsor.active } do
    link_to t(".activate"), { action: "activate" }, method: "put"
  end

  action_item :only => :show, :if => ->{ sponsor.active } do
    link_to t(".deactivate"), { action: "deactivate" }, method: "put"
  end

  #TODO optimize, so it only hits mongo once or twice
  batch_action :activate_selected do |selection|
    Sponsor.find(selection).each do |h|
      h.activate!
      h.save
    end
    redirect_to({ action: "index" }, notice: t("flash.activated_selected"))
  end

  batch_action :deactivate_selected do |selection|
    Sponsor.find(selection).each do |h|
      h.deactivate!
      h.save
    end
    redirect_to({ action: "index" }, notice: t("flash.deactivated_selected"))
  end
end
