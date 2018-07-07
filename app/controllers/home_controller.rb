class HomeController < ShopifyApp::AuthenticatedController
  def index
    @points = LoyaltyPoint.all
    @customers = ShopifyAPI::Customer.find(:all).map do |customer|
      CustomerDecorator.new(customer, @points)
    end
  end
end
