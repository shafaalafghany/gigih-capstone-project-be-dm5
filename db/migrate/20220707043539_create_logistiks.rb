class CreateLogistiks < ActiveRecord::Migration[7.0]
  def change
    create_table :logistiks do |t|
      t.string :jenis_bantuan
      t.string :nama_barang
      t.string :jumlah
      t.datetime :tanggal_distribusi
      t.belongs_to :penerima
      t.belongs_to :petugas
      t.belongs_to :kejadian
      t.timestamps
    end
  end
end
