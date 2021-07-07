class CreateYells < ActiveRecord::Migration[6.0]
  def change
    create_table :yells do |t|
      t.string :content,    null: false
      t.references :life, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
