Rails.configuration.stripe = {
  :publishable_key => 'pk_test_BCRMvgsBNCmP0NZr55Da7HpO00P3pnh8L9',
  :secret_key      => 'sk_test_veFoLuquTEGYRnaKMaiyUpmy00LMmNbc1h'
}





Stripe.api_key = Rails.configuration.stripe[:secret_key]


# Stripe.configure do |config|
#     config.secret_key = Rails.application.credentials.stripe_secret_key
#     config.publishable_key = Rails.application.credentials.stripe_publishable_key
#   end