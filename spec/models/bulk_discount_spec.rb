require 'rails_helper'

RSpec.describe BulkDiscount, type: :model do
  describe "validations" do
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :discount }
    it { should validate_presence_of :quantity }

    it "discount is between 0 and 100 and integers" do
      should validate_numericality_of(:discount).
        is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(100).
        only_integer
    end

    it "quantity is greater than 0 and integer" do
      should validate_numericality_of(:quantity).
        is_greater_than(0).
        only_integer
    end
  end

  describe "relationships" do
    it {should belong_to :item}
  end

end