class Payment < ApplicationRecord
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a
  end

  def process_payment
    if Rails.env.production?
      Stripe.api_key = ENV['STRIPE_TEST_SECRET_KEY']
    else
      Stripe.api_key = Rails.application.credentials.stripe[:stripe_test_secret_key]
    end
    customer = Stripe::Customer.create({ 
        email: email, 
        card: token,
        name: 'Test',
        address: {
          line1: '510 Townsend St',
          postal_code: '98140',
          city: 'Viman Nagar',
          state: 'CA',
          country: 'US'
        }
      })
    Stripe::Charge.create customer: customer.id,
    amount: 3400,
    description: 'Premium-ENV Changes',
    currency: 'usd'
  end
end
