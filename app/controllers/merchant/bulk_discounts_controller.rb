class Merchant::BulkDiscountsController < Merchant::BaseController

  def new
    @merchant = Merchant.find(current_user.merchant.id)
  end

  def create
    bulk_discount = BulkDiscount.new(discounts_params)
    if bulk_discount.save
      flash[:success] = "#{bulk_discount.discount}% discount on #{bulk_discount.item.name} Created"
      redirect_to merchant_bulk_discounts_path
    else
      flash.now[:error] = bulk_discount.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def edit
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def update
    bulk_discount = Item.find(params[:id])
    if bulk_discount.update(discounts_params)
      flash[:success] = "#{bulk_discount.discount}% discount on #{bulk_discount.item.name} Updated"
      redirect_to merchant_bulk_discounts_path
    else
      flash[:error] = bulk_discount.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    bulk_discount = BulkDiscount.find(params[:id])
    if bulk_discount.destroy
      flash[:success] = "#{bulk_discount.discount}% discount on #{bulk_discount.item.name} Deleted"
    else
      flash[:error] = bulk_discount.errors.full_messages.to_sentence
    end
    redirect_to merchant_bulk_discounts_path
  end

  private

  def discounts_params
    params.permit(:quantity, :discount, :item_id)
  end
end