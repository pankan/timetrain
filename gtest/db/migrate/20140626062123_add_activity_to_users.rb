class AddActivityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activity, :array
  end
end
