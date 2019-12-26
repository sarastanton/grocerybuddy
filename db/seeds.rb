
# Upload seed data from CSV file at spec/data/test-data.csv
file = Rails.root.join('spec', 'data', 'test-data.csv')
Item.import_from_csv(file)
