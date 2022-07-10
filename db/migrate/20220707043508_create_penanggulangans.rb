class CreatePenanggulangans < ActiveRecord::Migration[7.0]
  def change
    create_table :penanggulangans do |t|
      t.datetime :tanggal
      t.string :penanggulangan
      t.string :lokasi
      t.belongs_to :petugas
      t.belongs_to :kejadian
      t.timestamps
    end
  end
end
