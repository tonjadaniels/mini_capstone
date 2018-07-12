class AddAdminToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :admin, :boolean, default: false
  end
end
