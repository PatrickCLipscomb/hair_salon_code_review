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

get('/add_new_clients') do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:add_clients)
end

post('/new_client') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id').to_i
  @client = Client.new({:name => name, :stylist_id => stylist_id})
  @client.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:add_clients)
end

delete('/delete_client') do
  name = params.fetch('name')
  @client_deleted = Client.find_by_name(name)
  @client_deleted.delete()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:add_clients)
end

patch('/update_client') do
  name = params.fetch('name')
  new_name = params.fetch('new_name')
  stylist_id = params.fetch('stylist_id').to_i
  @client_updated = Client.find_by_name(name)
  @old_name = @client_updated.name()
  @client_updated.update(new_name, stylist_id)
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:add_clients)
end

get('/stylist/:name') do
  name = params.fetch('name')
  @stylist = Stylist.find_by_name(name)
  @clients = Client.find_by_stylist(@stylist.id())
  erb(:stylist_info)
end

get('/see_unassigned_clients') do
  @clients = Client.all()
  @stylists = Stylist.all()
  @unassigned_clients = Client.all()
  assigned_clients = []
  @unassigned_clients.each() do |client|
    @stylists.each() do |stylist|
      if client.stylist_id == stylist.id
        assigned_clients.push(client)
      end
    end
    assigned_clients
  end
  assigned_clients
  @unassigned_clients.each() do |client|
    if assigned_clients.include?(client)
      @unassigned_clients.delete(client)
    end
  end
  @unassigned_clients
  erb(:add_clients)
end
