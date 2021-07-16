class CreateLights < ActiveRecord::Migration[6.0]
  def change
    create_table :lights do |t|
      t.references :visitor, null: false, foreign_key: { to_table: :users }
      t.references :visited, null: false, foreign_key: { to_table: :users }
      t.references :life,    null: true,  foreign_key: true
      t.references :yell,    null: true,  foreign_key: true
      t.references :message, null: true,  foreign_key: true
      t.references :room,    null: true,  foreign_key: true
      t.string :action
      t.boolean :checked, default: false, null: false


      t.timestamps
    end
  end
end
