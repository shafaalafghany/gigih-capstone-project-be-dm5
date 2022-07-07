class CreatePelapors < ActiveRecord::Migration[7.0]
  def change
    create_table :pelapors do |t|

      t.timestamps
    end
  end
end
