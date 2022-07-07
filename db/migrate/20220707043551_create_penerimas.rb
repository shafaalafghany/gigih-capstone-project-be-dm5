class CreatePenerimas < ActiveRecord::Migration[7.0]
  def change
    create_table :penerimas do |t|

      t.timestamps
    end
  end
end
