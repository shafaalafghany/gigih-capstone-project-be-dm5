class CreateKejadians < ActiveRecord::Migration[7.0]
  def change
    create_table :kejadians do |t|

      t.timestamps
    end
  end
end
