class AddNameAndNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :phone,    :integer




    add_index :users, :username,  unique: true
    add_index :users, :phone,     unique: true
  end
end
