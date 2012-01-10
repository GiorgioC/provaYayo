class AddElementOrderToPages < ActiveRecord::Migration
  def change
    add_column :pages, :element_order, :integer
  end
end
