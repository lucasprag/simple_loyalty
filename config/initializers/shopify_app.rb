ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "465fbda81f9243b5fb9d711c434664b4"
  config.secret = "c063e3c0f0d2b4d019a1c1d636d08e10"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
