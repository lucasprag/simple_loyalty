ShopifyApp.configure do |config|
  config.application_name = 'Simple Loyalty'
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_SECRET_KEY']
  config.scope = 'read_orders, read_customers'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    { topic: 'orders/paid', address: 'https://2f0a78f7.ngrok.io/webhooks/orders/paid', format: 'json' },
  ]
end
