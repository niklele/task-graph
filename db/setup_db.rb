require 'sequel'
require 'dotenv/load'

DB = Sequel.connect(ENV['DATABASE_URL'])

puts 'creating users table'
DB.create_table? :users do
    Integer :id, :index => true
    String :name
    primary_key [:id]
end

puts 'creating tasks table'
DB.create_table? :tasks do
    Integer :id, :index => true
    String :name
    FalseClass :completed
    String :description, :text=>true
    Integer :priority
    primary_key [:id]
end

puts 'creating edges table'
DB.create_table? :edges do
    Integer :id, :index => true
    foreign_key :user_id, :users
    foreign_key :from_task_id, :tasks
    foreign_key :to_task_id, :tasks
    unique [:user_id, :from_task_id, :to_task_id]
    primary_key [:id]
end
