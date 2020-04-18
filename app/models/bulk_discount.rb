class BulkDiscount <ApplicationRecord
  validates_presence_of :item_id, :quantity, :discount

  belongs_to :item

end
