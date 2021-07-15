class Flash < ActiveRecord::Migration[6.0]
  def change
    drop_table :flashes
  end
end
