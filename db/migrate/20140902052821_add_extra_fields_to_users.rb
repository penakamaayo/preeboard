class AddExtraFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :course, :string
    add_column :users, :school, :string
    add_column :users, :birth_date, :date
  end
end
