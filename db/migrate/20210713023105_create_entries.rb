class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references     :room
      t.references     :user

      t.timestamps
    end
  end
end
