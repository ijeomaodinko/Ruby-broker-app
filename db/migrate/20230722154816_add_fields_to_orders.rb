class AddFieldsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :company_id, :integer
    add_column :orders, :quantity, :integer
    add_column :orders, :price, :decimal
    add_column :orders, :product_name, :string
  end
end
