class CreateLives < ActiveRecord::Migration[6.0]
  def change
    create_table :lives do |t|
      t.references  :user,                   foreign_key: true
      t.text        :bad_thing,              null: false
      t.text        :hope,                   null: false
      t.integer     :month_id,               null: false
      t.integer     :how_long_id,            null: false
      t.integer     :want_id,                null: false
      t.integer     :tired_id,               null: false
      t.timestamps
    end
  end
end
