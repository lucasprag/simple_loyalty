Rails.application.routes.draw do
  root to: 'home#index'
  mount ShopifyApp::Engine, at: '/'

  scope :webhooks do
    post 'orders/paid' => 'orders#paid'
  end
end
