require 'capybara/rspec'
require './app'
require 'pg'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do | config |
  config.after(:each) do
    DB.exec("delete from clients *;")
    DB.exec("delete from stylists *;")
  end
end
