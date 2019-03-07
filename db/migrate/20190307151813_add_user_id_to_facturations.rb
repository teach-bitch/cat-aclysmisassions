class AddUserIdToFacturations < ActiveRecord::Migration[5.2]
  def change
    add_reference :facturations, :user, foreign_key: true
  end
end
