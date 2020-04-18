class BulkDiscount <ApplicationRecord
  validates_presence_of :item_id, :merchant_id, :quantity, :discount

  belongs_to :item
  belongs_to :merchant

end
