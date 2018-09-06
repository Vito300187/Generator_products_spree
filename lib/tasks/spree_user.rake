namespace :products do
  desc 'Load users in database'
  task :load_users, :environment do
    # Created 5 random users
    5.times do |i|
      Spree::User.create!(
          email:     "#{i + 1}@mail.ru",
          password:  1234567890
      )
    end

    # Created admin user, if him not created
    unless Spree::User.where(email: 'spree@example.com').exists?
      spree_user_admin = Spree::User.create!(email: 'spree@example.com', password: 'spree123')
      role = Spree::Role.find_or_create_by(name: 'admin')
      spree_user_admin.spree_roles << role
    end
    puts 'Users created'

  end
end
