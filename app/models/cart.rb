class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def add_item(item)
    @contents[item] = 0 if !@contents[item]
    @contents[item] += 1
  end

  def subtract_item(item)

    if @contents[item] > 1
      @contents[item] -= 1
    else
      remove_item(item)
    end
  end

  def remove_item(item)
    @contents.delete(item)
  end

  def total_items
    @contents.values.sum
  end

  def items
    item_quantity = {}
    @contents.each do |item_id,quantity|
      item_quantity[Item.find(item_id)] = quantity
    end
    item_quantity
  end

  def subtotal(item)
    item.price_after_discounts(quantity(item)) * quantity(item)
  end

  def total
    @contents.sum do |item_id, quantity|
      Item.find(item_id).price_after_discounts(quantity) * quantity
    end
  end

  def quantity(item)
    @contents[item.id.to_s]
  end

  def discount_savings(item)
    item.price * quantity(item) - subtotal(item)
  end

  def quantity_to_next_discount(item)
    return false unless discount = next_discount(item) 
    discount.quantity - quantity(item)
  end

  def next_discount(item)
    item.bulk_discounts.order(:discount).where('quantity > ?', quantity(item)).first
  end
end
