namespace :products do
  desc 'Load products in database'
  task load_products: :environment do
    # Created products
    @count_of_products.times do |i|
      kinds_rand = File.open(Rails.root.join('db', 'mock_data', 'kinds.md')).readlines.sample
      regions_rand = File.open(Rails.root.join('db', 'mock_data', 'regions.md')).readlines.sample
      names_rand = File.open(Rails.root.join('db', 'mock_data', 'names.md')).readlines.sample
      file_image = File.open(Rails.root.join('app', 'assets', 'images', 'bottle', "#{rand(1..20)}.jpg"))
      product = Spree::Product.create!(
          name:               name = names_rand.chomp,
          description:        "New wine product #{i + 1}",
          available_on:       Time.zone.now - 1.day,
          shipping_category:  Spree::ShippingCategory.first,
          meta_description:   'Wine, is the best drink in the world',
          meta_keywords:      %w[wine drink alcohol bottle expensive drink'],
          meta_title:         name,
          price:              rand(50..800),
          sku:                rand(1_000_000..1_999_999),
          year:               rand(1960..2005),
          region:             regions_rand.chomp,
          alcohol_percentage: rand(5..15),
          wine_kind:          kinds_rand.chomp,
          wine_color:         Spree::Variant.wine_colors.keys.sample,
          wine_term:          Spree::Variant.wine_terms.keys.sample
      )

      product.stock_items.each { |stock_item| stock_item.adjust_count_on_hand(rand(10..50)) }

      image = Spree::Image.create!(
          attachment: {
              io:                file_image,
              filename:          "#{rand(1..20)}.jpg"
          }
      )

      product.images << image

      product.ratings.create!(
          user_id:             Spree::User.all.sample.id,
          rating:              rand(1..5)
      )
    end

    puts 'Products created'
  end
end

