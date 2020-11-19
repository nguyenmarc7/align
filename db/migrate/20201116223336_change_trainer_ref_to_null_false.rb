class ChangeTrainerRefToNullFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_null :products, :name, false
  end
end
