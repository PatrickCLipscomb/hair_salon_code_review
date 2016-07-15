class Client
  attr_reader(:id, :name, :stylist_id)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes[:id] || nil
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end
  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      clients.push(Client.new({
        :name => client.fetch('name'),
        :stylist_id => client.fetch('stylist_id').to_i,
        :id => client.fetch('id').to_i
        }))
    end
    clients
  end
  define_method(:==) do |another_client|
    (self.id == another_client.id) && (self.name == another_client.name)
  end
  define_method(:update) do |updated_name, updated_stylist_id|
    @name = updated_name
    @stylist_id = updated_stylist_id
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{@stylist_id} WHERE id = #{self.id};")
  end
  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id}")
  end
end
