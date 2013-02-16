ActiveAdmin.register Highlight do

  filter :description
  filter :company_id

  index do
    selectable_column
    bcolumn :active
    column :title
    column :description
    column :company
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :image
      f.input :title
      f.input :description, :as => :text
      f.input :active, :as => :boolean
    end
    f.actions
  end

  member_action :activate, :method => :put do
    highlight = Highlight.find(params[:id])
    highlight.activate!
    if highlight.save
      redirect_to({ action: "show" }, notice: t("flash.activated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  member_action :deactivate, :method => :put do
    highlight = Highlight.find(params[:id])
    highlight.deactivate!
    if highlight.save
      redirect_to({ action: "show" }, notice: t("flash.deactivated"))
    else
      redirect_to({ action: "show" }, alert: t("flash.error"))
    end
  end

  action_item :only => :show, :if => ->{ not highlight.active } do
    link_to t(".activate"), { action: "activate" }, method: "put"
  end

  action_item :only => :show, :if => ->{ highlight.active } do
    link_to t(".deactivate"), { action: "deactivate" }, method: "put"
  end

  #TODO optimize, so it only hits mongo once or twice
  batch_action :activate_selected do |selection|
    Highlight.find(selection).each do |h|
      h.activate!
      h.save
    end
    redirect_to({ action: "index" }, notice: t("flash.activated_selected"))
  end

  batch_action :deactivate_selected do |selection|
    Highlight.find(selection).each do |h|
      h.deactivate!
      h.save
    end
    redirect_to({ action: "index" }, notice: t("flash.deactivated_selected"))
  end
end
