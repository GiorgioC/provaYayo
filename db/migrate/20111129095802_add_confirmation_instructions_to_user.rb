class AddConfirmationInstructionsToUser < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_instructions, :string
  end
end
