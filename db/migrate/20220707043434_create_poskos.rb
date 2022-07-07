class CreatePoskos < ActiveRecord::Migration[7.0]
  def change
    create_table :poskos do |t|
      t.string :nama
      t.string :lokasi
      t.integer :kapasitas
      t.string :penanggung_jawab
      t.belongs_to :kejadian
      t.timestamps
    end
  end
end
