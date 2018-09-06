# Generator 50 products for Spree Store

##### Added generator for Spree store, where can generate 50 products with description, name, title, wine kind, alcohol percentage, region, year, price and image

- folder bottle with image, must be put in the following way app/assets/images
- folder mock_data with description products, must be put folder db
- file generator_products.rb must be put tasks

The products generator will load any random products with description, region, alcohol percentage, product name, wine term, wine color and photo.
- You need to run command in console rake products:**load_seed[and you quantity]**. Example **rake products:load_seed[50]**