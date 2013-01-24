class AddAcceptedTermsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accepted_terms, :boolean, :null => false, :default => false
  end
end
