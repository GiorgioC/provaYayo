class AddAcceptTermsAndPrivacyToUser < ActiveRecord::Migration
  def change
    add_column :users, :accept_terms_and_privacy, :boolean
  end
end
