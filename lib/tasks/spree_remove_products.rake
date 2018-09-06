namespace :products do
  desc 'Remove example products'
  task remove_seed: :environment do
    Spree::Product.destroy_all
    Spree::Order.destroy_all
    Spree::User.destroy_all
    Spree::Zone.destroy_all
    Spree::ShippingCategory.destroy_all
    Spree::State.destroy_all
    array_sum = [ Spree::Product.count, Spree::Order.count,
                  Spree::State.count, Spree::Order.count,
                  Spree::User.count, Spree::Zone.count,
                  Spree::ShippingCategory.count ].sum

    puts "Quantity Products #{Spree::Product.count}"
    puts "Quantity Order #{Spree::Order.count}"
    puts "Quantity User #{Spree::User.count}"
    puts "Quantity Zone #{Spree::Zone.count}"
    puts "Quantity Shipping category #{Spree::ShippingCategory.count}"
    puts "Quantity State #{Spree::State.count}"
    puts "_" * 20
    array_sum.eql?(0) ? (puts "All data removed") : (puts "Not all data removed")

  end
end
