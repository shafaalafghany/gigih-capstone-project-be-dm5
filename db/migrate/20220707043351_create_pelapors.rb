class CreatePelapors < ActiveRecord::Migration[7.0]
  def change
    create_table :pelapors do |t|
      t.string :nama
      t.string :nik
      t.string :telp
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.datetime :tanggal
      t.belongs_to :user
      t.timestamps
    end
  end
end
