namespace :products do
  desc 'Load shipping methods in database'
  task load_shipping_methods: :environment do
    # Created shipping methods
    spree_shipping_methods = %w[FedEx DHL USPS RussianPost PonyExpress SDEK]
    spree_shipping_methods.each do |name_shipping_companys|
      shipping_method = Spree::ShippingMethod.new(
          name:            name_shipping_companys,
          display_on:      'both',
          admin_name:      "Devilery #{name_shipping_companys}",
          code:            name_shipping_companys.upcase,
          tracking_url:    "https://www.#{name_shipping_companys}.ru/TRACKING"
      )

      spree_calculators = Spree::Calculator.create!(
          type:             Spree::Calculator::Shipping::FlatPercentItemTotal,
          calculable_type:  Spree::ShippingMethod
      )

      shipping_method.shipping_categories << Spree::ShippingCategory.all.sample
      shipping_method.zones << Spree::Zone.all.sample
      shipping_method.calculator = spree_calculators
      shipping_method.save!
    end
    puts 'Shipping methods created'

  end
end
