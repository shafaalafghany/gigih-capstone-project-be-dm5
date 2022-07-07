class CreateDistribusis < ActiveRecord::Migration[7.0]
  def change
    create_table :distribusis do |t|

      t.timestamps
    end
  end
end
