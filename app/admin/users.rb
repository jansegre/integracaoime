ActiveAdmin.register User do

  filter :name
  filter :email
  #filter :approved, :as => :select
  filter :student, :as => :select

  actions :index, :show, :new, :create, :update, :edit

  index do
    selectable_column
    column :name
    column :email
    bcolumn :admin
    #bcolumn :unapproved
    bcolumn :student
    #column :current_sign_in_at
    #column :last_sign_in_at
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
      #f.input :approved, :as => :boolean
      f.input :student, :as => :boolean
      f.input :company
    end
    f.actions
  end

  member_action :approve, :method => :put do
    user = User.find(params[:id])
    user.approve!
    if user.save
      redirect_to({:action => :show}, :notice => t("flash.approved"))
    else
      redirect_to({:action => :show}, :warn => t("flash.error"))
    end
  end

  member_action :lock, :method => :put do
    user = User.find(params[:id])
    user.lock!
    user.save
    redirect_to({:action => :show}, :notice => t("flash.locked"))
  end

  member_action :unlock, :method => :put do
    user = User.find(params[:id])
    user.unlock!
    user.save
    redirect_to({:action => :show}, :notice => t("flash.unlocked"))
  end

  action_item :only => :show, :if => ->{ not user.approved? } do
    link_to t(".approve"), approve_admin_user_path, :method => :put
  end

  action_item :only => :show, :if => ->{ not user.locked? and not user.admin? } do
    link_to t(".lock"), lock_admin_user_path, :method => :put
  end

  action_item :only => :show, :if => ->{ user.locked? and not user.admin? } do
    link_to t(".unlock"), unlock_admin_user_path, :method => :put
  end

  #TODO optimize, so it only hits mongo once or twice
  batch_action :approve do |selection|
    User.find(selection).each do |u|
      u.approve!
      u.save
    end
    redirect_to({:action => :index}, :notice => "Approved!")
  end
end
