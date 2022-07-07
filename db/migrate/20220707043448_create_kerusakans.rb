class CreateKerusakans < ActiveRecord::Migration[7.0]
  def change
    create_table :kerusakans do |t|
      t.string :kerusakan
      t.string :kerugian
      t.string :keterangan
      t.belongs_to :kejadian
      t.timestamps
    end
  end
end
