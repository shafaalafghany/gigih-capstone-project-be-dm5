class AddColumnStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :kejadians, :status, :string
  end
end
