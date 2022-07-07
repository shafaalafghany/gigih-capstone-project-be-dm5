class CreateDistribusis < ActiveRecord::Migration[7.0]
  def change
    create_table :distribusis do |t|
      t.datetime :tanggal
      t.integer :jumlah
      t.belongs_to :petuga
      t.belongs_to :logistik
      t.timestamps
    end
  end
end
