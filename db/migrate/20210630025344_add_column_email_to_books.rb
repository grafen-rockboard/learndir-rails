class AddColumnEmailToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :email, :string
  end
end
