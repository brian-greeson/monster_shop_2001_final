class BulkDiscount <ApplicationRecord
  validates_presence_of :item_id, :quantity, :discount
  validates :discount, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
  validates :quantity, numericality: {only_integer: true, greater_than: 0}

  belongs_to :item

end
