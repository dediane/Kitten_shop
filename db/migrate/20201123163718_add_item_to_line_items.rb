class AddItemToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_items, :item, foreign_key: true
  end
end
