class ChangePriceToBeDecimalInFacturations < ActiveRecord::Migration[5.2]
  def change
    change_column :facturations, :price, :decimal
  end
end
