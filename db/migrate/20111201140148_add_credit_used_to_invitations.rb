class AddCreditUsedToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :credit_used, :boolean
  end
end
