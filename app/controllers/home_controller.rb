class HomeController < ShopifyApp::AuthenticatedController
  LIMIT = 10

  def index
    @points = shop.loyalty_points
    @customers_count = ShopifyAPI::Customer.count

    @pages_count = @customers_count / LIMIT
    @current_page = (params[:page] || 1).to_i

    @customers = ShopifyAPI::Customer
      .find(:all, params: { limit: LIMIT, page: @current_page })
      .map { |customer| CustomerDecorator.new(customer, @points) }
      .sort_by { |customer| -customer.points_balance }
  end

  private

  def shop
    @shop ||= Shop.find_by(shopify_domain: shop_session.url)
  end
end
