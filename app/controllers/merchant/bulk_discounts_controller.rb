class Merchant::BulkDiscountsController < Merchant::BaseController


  private

  def discounts_params
    params.permit()
  end
end