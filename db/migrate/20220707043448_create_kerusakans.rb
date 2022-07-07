class CreateKerusakans < ActiveRecord::Migration[7.0]
  def change
    create_table :kerusakans do |t|

      t.timestamps
    end
  end
end
