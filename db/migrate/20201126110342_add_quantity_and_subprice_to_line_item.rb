class AddQuantityAndSubpriceToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :quantity, :integer
    add_column :line_items, :subtotal, :decimal
  end
end
