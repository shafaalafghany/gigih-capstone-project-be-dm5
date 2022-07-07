class CreatePetugas < ActiveRecord::Migration[7.0]
  def change
    create_table :petugas do |t|

      t.timestamps
    end
  end
end
