# Generator products for Spree Store

##### Added generator for Spree store, where can generate products with description, name, title, wine kind, alcohol percentage, region, year, price and image, wine term, wine color.
##### In generator as include State USA, shipping cathegory, shipping methods, 6 users(1 admin).

- folder bottle with image, must be put in the following way app/assets/images
- folder mock_data with description products, must be put folder db
- files for generator in lib/tasks

- You need to run command in console **rake products:load_seed[and you quantity]**. Example **rake products:load_seed[50]**
- For clean the database(state, order, user, zone, shipping cathegory,shipping methods, products ), need run **rake products:remove_seed**
