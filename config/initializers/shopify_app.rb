ShopifyApp.configure do |config|
  config.application_name = "Simple Loyalty"
  config.api_key = "465fbda81f9243b5fb9d711c434664b4"
  config.secret = "c063e3c0f0d2b4d019a1c1d636d08e10"
  config.scope = "read_orders, read_customers"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'orders/paid', address: 'https://2f0a78f7.ngrok.io/webhooks/orders/paid', format: 'json'},
  ]
end
