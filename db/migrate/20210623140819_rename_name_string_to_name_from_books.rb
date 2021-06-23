class RenameNameStringToNameFromBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :nameString, :name
  end
end
