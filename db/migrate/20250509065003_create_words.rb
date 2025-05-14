class CreateWords < ActiveRecord::Migration[7.2]
  def change
    create_table :words do |t|
      t.string :english
      t.string :japanese
      t.integer :user_id

      t.timestamps
    end
  end
end
