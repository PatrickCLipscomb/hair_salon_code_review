class Client
  attr_reader(:name, :stylist_id)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes[:id] || nil
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, sylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end
  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      clients.push(Client.new({
        :name = client.fetch('name')
        :stylist_id = client.fetch('stylist_id').to_i
        :id = client.fetch('id').to_i
        }))
    end
    clients
  end
end
