class HomeController < ShopifyApp::AuthenticatedController
  def index
    @points = LoyaltyPoint.all
    @customers = ShopifyAPI::Customer
      .find(:all)
      .map { |customer| CustomerDecorator.new(customer, @points) }
      .sort_by { |customer| -customer.points_balance }
  end
end
