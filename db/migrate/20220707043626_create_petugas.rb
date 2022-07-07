class CreatePetugas < ActiveRecord::Migration[7.0]
  def change
    create_table :petugas do |t|
      t.string :telp
      t.string :nama
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :alamat
      t.string :bagian
      t.integer :status
      t.timestamps
    end
  end
end
