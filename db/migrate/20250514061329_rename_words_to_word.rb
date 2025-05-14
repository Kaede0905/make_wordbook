class RenameWordsToWord < ActiveRecord::Migration[7.2]
  def change
    rename_table :words, :word
  end
end
