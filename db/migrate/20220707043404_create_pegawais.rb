class CreatePegawais < ActiveRecord::Migration[7.0]
  def change
    create_table :pegawais do |t|

      t.timestamps
    end
  end
end
