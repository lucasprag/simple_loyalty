class PaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      shop.loyalty_points.create(
        order_id: webhook[:id],
        customer_id: webhook[:customer][:id],
        points: webhook[:total_price].to_i
      )
    end
  end
end
