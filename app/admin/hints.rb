ActiveAdmin.register Hint do
  menu parent: "Dashboard"

  filter :description

  index do
    selectable_column
    column :description
    column :published
    default_actions
  end

  show do |i|
    attributes_table do
      i.attribute_names.each do |a|
        row a unless a == "image"
      end
      row :image do
        a href: i.image.url do
          image_tag(i.image.thumb.url)
        end unless i.image.url.nil?
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :image
      f.input :description
      f.input :url
    end
    f.actions
  end

  member_action :publish, :method => :put do
    hint = Hint.find(params[:id])
    hint.published = Date.current
    if hint.save
      redirect_to({:action => :show}, :notice => t("flash.published"))
    else
      redirect_to({:action => :show}, :alert => t("flash.error"))
    end
  end

  member_action :unpublish, :method => :put do
    hint = Hint.find(params[:id])
    hint.published = nil
    if hint.save
      redirect_to({:action => :show}, :notice => t("flash.unpublished"))
    else
      redirect_to({:action => :show}, :alert => t("flash.error"))
    end
  end

  action_item :only => :show, :if => ->{ hint.published.nil? } do
    link_to t(".publish"), { action: "publish" }, method: "put"
  end

  action_item :only => :show, :if => ->{ not hint.published.nil? } do
    link_to t(".unpublish"), { action: "unpublish" }, method: "put"
  end
end
