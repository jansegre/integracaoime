ActiveAdmin.register Hint do

  filter :description

  index do
    selectable_column
    column :description
    column :published
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :image
      f.input :description
    end
    f.actions
  end

  member_action :publish, :method => :put do
    hint = Hint.find(params[:id])
    hint.published = Date.current
    if hint.save
      redirect_to({:action => :show}, :notice => t("flash.published"))
    else
      redirect_to({:action => :show}, :warn => t("flash.error"))
    end
  end

  member_action :unpublish, :method => :put do
    hint = Hint.find(params[:id])
    hint.published = nil
    if hint.save
      redirect_to({:action => :show}, :notice => t("flash.unpublished"))
    else
      redirect_to({:action => :show}, :warn => t("flash.error"))
    end
  end

  action_item :only => :show, :if => ->{ hint.published.nil? } do
    link_to t(".publish"), { action: "publish" }, method: "put"
  end

  action_item :only => :show, :if => ->{ not hint.published.nil? } do
    link_to t(".unpublish"), { action: "unpublish" }, method: "put"
  end
end
