class CreatePegawais < ActiveRecord::Migration[7.0]
  def change
    create_table :pegawais do |t|
      t.string :nik
      t.string :nama
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :jk
      t.string :alamat
      t.string :telp
      t.string :jabatan
      t.integer :status
      t.belongs_to :user
      t.timestamps
    end
  end
end
