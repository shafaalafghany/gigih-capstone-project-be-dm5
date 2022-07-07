class CreateKejadians < ActiveRecord::Migration[7.0]
  def change
    create_table :kejadians do |t|
      t.datetime :tanggal
      t.string :kejadian
      t.string :deskripsi_kejadian
      t.string :lokasi
      t.belongs_to :pelapor
      t.timestamps
    end
  end
end
