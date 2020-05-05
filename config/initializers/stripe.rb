if Rails.env.deveopment? || Rails.env.test?
  Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.stripe[:stripe_test_publishable_key],
    :secret_key => Rails.application.credentials.stripe[:stripe_test_secret_key]
  }  
else
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_TEST_SECRET_KEY']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]  
