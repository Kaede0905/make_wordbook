class RenameWordToWords < ActiveRecord::Migration[7.2]
  def change
    rename_table :word, :words
  end
end
