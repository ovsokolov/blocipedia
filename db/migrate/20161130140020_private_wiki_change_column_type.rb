class PrivateWikiChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column(:wikis, :private, :integer, default: 0)
  end
end
