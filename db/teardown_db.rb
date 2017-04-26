require 'sequel'
require 'dotenv/load'

DB = Sequel.connect(ENV['DATABASE_URL'])

puts 'dropping table edges'
DB.drop_table?(:edges)

puts 'dropping table users'
DB.drop_table?(:users)

puts 'dropping table tasks'
DB.drop_table?(:tasks)