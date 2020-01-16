class CreateThrows < ActiveRecord::Migration[6.0]
  def change
    create_table :throws do |t|
      t.integer :pins_down
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
