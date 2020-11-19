class AddSoldToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sold, :boolean
  end
end
