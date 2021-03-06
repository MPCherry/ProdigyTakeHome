class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :a2
      t.string :a3
      t.references :currency, null: false, foreign_key: true
      t.boolean :enabled

      t.timestamps
    end
  end
end
