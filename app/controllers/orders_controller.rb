class OrdersController < ApplicationController
  include ShopifyApp::WebhookVerification

  def paid
    params.permit!
    PaidJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    head :no_content
  end

  private

  def webhook_params
    params.except(:controller, :action, :type)
  end
end
