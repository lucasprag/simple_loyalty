class HomeController < ShopifyApp::AuthenticatedController
  class CustomerDecorator
    attr_accessor :customer, :points

    def initialize(customer, points)
      @customer = customer.attributes
      @points = points.where(customer_id: @customer['id'])
    end

    def id
      customer['id']
    end

    def name
      "#{customer['first_name']} #{customer['last_name']}"
    end

    def email
      customer['email']
    end

    def points_balance
      points.pluck(:points).sum
    end
  end

  def index
    @points = LoyaltyPoint.all
    @customers = ShopifyAPI::Customer.find(:all).map do |customer|
      CustomerDecorator.new(customer, @points)
    end
  end
end
