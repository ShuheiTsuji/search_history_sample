class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :zip
      t.string :address
      t.integer :sex, null: false, limit: 1

      t.timestamps
    end
  end
end
