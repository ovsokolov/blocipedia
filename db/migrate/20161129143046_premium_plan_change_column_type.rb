class PremiumPlanChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column(:users, :premium_plan, :integer, default: 0)
  end
end
