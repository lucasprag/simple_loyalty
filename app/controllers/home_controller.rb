class HomeController < ShopifyApp::AuthenticatedController
  LIMIT = 10

  def index
    @customers_count = ShopifyAPI::Customer.count

    # pagination
    rest = @customers_count > LIMIT ? (@customers_count % LIMIT) : 0
    @pages_count = (@customers_count / LIMIT) + rest
    @current_page = (params[:page] || 1).to_i

    @points = shop.loyalty_points
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
