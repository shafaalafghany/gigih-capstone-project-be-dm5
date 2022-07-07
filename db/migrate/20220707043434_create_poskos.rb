class CreatePoskos < ActiveRecord::Migration[7.0]
  def change
    create_table :poskos do |t|

      t.timestamps
    end
  end
end
