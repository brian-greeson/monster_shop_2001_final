class AddmerchantsToBulkDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_reference :bulk_discounts, :merchant, foreign_key: true
    add_reference :bulk_discounts, :item, foreign_key: true
  end
end
