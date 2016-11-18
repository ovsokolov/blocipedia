class AddPremiumPlanToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :premium_plan, :boolean, default: false
  end
end
