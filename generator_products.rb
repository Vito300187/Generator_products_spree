namespace :products do
  desc 'Load 50 products in database' #description rake task
  task load_seed: :environment do
    50.times do |i| #gerenator 50 products for project
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
          meta_title:         name, #random name
          price:              rand(50..800), #random price
          sku:                rand(1_000_000..1_999_999), #random sku
          year:               rand(1960..2005), #random year
          region:             regions_rand.chomp, #random region
          alcohol_percentage: rand(5..15), #random alcohol
          wine_kind:          kinds_rand.chomp #random kind
      )
      #Create image for every products in cycle
      image = Spree::Image.create!(
          attachment: {
              io:       file_image,
              filename: "#{rand(1..20)}.jpg"
          }
      )
      #Added image in products
      product.images << image
    end
      #And put string console all went well
    puts 'Here are your products'
  end
end
