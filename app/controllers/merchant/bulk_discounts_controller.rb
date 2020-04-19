class Merchant::BulkDiscountsController < Merchant::BaseController

  def new
    @merchant = Merchant.find(current_user.merchant.id)
  end

  def create
    discount = BulkDiscount.new(discounts_params)
    if discount.save
      flash[:success] = "#{discount.discount}% discount on #{discount.item.name} Created"
      redirect_to merchant_bulk_discounts_path
    else
      flash.now[:error] = @item.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def discounts_params
    params.permit(:quantity, :discount, :item_id)
  end
end