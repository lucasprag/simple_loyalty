class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :loyalty_points
end
