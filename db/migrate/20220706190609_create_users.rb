class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nama
      t.string :username
      t.string :password_digest
      t.string :telp

      t.timestamps
    end
  end
end
