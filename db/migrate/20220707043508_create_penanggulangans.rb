class CreatePenanggulangans < ActiveRecord::Migration[7.0]
  def change
    create_table :penanggulangans do |t|

      t.timestamps
    end
  end
end
