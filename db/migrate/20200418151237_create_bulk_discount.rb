class CreateBulkDiscount < ActiveRecord::Migration[5.1]
  def change
    create_table :bulk_discounts do |t|
      t.integer :discount
      t.integer :quantity
      t.timestamps
    end
  end
end
