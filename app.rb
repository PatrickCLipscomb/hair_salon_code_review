require("capybara")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/add_new_stylists') do
  @stylists = Stylist.all()
  erb(:add_stylist)
end

post('/new_stylist') do
  name = params.fetch('name')
  @stylist = Stylist.new({:name => name})
  @stylist.save()
  @stylists = Stylist.all()
  erb(:add_stylist)
end

delete('/delete_stylist') do
  name = params.fetch('name')
  @stylist_deleted = Stylist.find_by_name(name)
  @stylist_deleted.delete()
  @stylists = Stylist.all()
  erb(:add_stylist)
end

patch('/update_stylist') do
  name = params.fetch('name')
  new_name = params.fetch('new_name')
  @stylist_updated = Stylist.find_by_name(name)
  @old_name = @stylist_updated.name()
  @stylist_updated.update(new_name)
  @stylists = Stylist.all()
  erb(:add_stylist)
end
