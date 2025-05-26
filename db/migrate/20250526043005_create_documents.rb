class CreateDocuments < ActiveRecord::Migration[7.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.integer :File_number

      t.timestamps
    end
  end
end
