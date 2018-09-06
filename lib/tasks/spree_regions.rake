namespace :products do
  desc 'Load regions in database'
  task load_regions: :environment do
    # Created regions, for example USA
    all_state_file_open = File.open(Rails.root.join('db', 'mock_data','state.txt')).readlines
    all_state_file_open.each { |state| Spree::Zone.create!(name: state, description: 'USA') }
    puts 'Regions created'

  end
end
