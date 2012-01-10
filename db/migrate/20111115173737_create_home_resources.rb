class CreateHomeResources < ActiveRecord::Migration
  def change
    create_table :home_resources do |t|
      t.string :title
      t.string :background
      t.string :iconic
      t.timestamps
    end
  end
end
