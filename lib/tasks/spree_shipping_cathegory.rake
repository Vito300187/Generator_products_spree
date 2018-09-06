namespace :products do
  desc 'Load category in database'
  task load_category: :environment do
    # Created cathegory
    shipping_category_box  = %w[Small Medium Large]
    shipping_category_box.each { |shipping| Spree::ShippingCategory.create!( name: shipping ) }
    puts 'Cathegory created'
  end
end