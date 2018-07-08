class HomeController < ShopifyApp::AuthenticatedController
  def index
    @points = shop.loyalty_points
    @customers = ShopifyAPI::Customer
      .find(:all)
      .map { |customer| CustomerDecorator.new(customer, @points) }
      .sort_by { |customer| -customer.points_balance }
  end

  private

  def shop
    @shop ||= Shop.find_by(shopify_domain: shop_session.url)
  end
end
