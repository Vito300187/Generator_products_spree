namespace :products do
  desc 'Load products in database'
  task :load_seed, [:product_quantity] => [:environment] do |_task, args|
    # Instance variable need, for transfer in another file
    @count_of_products = args[:product_quantity].to_i
    count_of_products = @count_of_products
    abort("As you put #{count_of_products} quantity, products not created, example => rake products:load_seed[10]") if count_of_products.eql?(0)

    Rake::Task['products:load_users'].invoke
    Rake::Task['products:load_category'].invoke
    Rake::Task['products:load_products'].invoke
    Rake::Task['products:load_regions'].invoke
    Rake::Task['products:load_shipping_methods'].invoke

    how_many_products = count_of_products > 1 ? 'products' : 'product'
    puts "Here are your #{count_of_products} #{how_many_products}"

  end
end
