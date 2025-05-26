class AddFileNumberToWords < ActiveRecord::Migration[7.2]
  def change
    add_column :words, :File_number, :integer
  end
end
