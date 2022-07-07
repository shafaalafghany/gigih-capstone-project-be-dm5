class CreateLogistiks < ActiveRecord::Migration[7.0]
  def change
    create_table :logistiks do |t|

      t.timestamps
    end
  end
end
