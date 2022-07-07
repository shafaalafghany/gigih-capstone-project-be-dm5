class CreatePenerimas < ActiveRecord::Migration[7.0]
  def change
    create_table :penerimas do |t|
      t.datetime :tanggal
      t.string :nama
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :jk
      t.string :telp
      t.belongs_to :pelapor
      t.timestamps
    end
  end
end
