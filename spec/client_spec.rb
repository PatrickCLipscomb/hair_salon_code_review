require('spec_helper')

describe(Client) do
  describe('.all') do
    it "will return an array of all the objects in the table" do
      client_test = Client.new({:name => "pedro", :stylist_id => '3'})
      client_test2 = Client.new({:name => "peter", :stylist_id => '2'})
      client_test.save()
      client_test2.save()
      expect(Client.all()).to(eq([client_test, client_test2]))
    end
  end
  describe('#save') do
    it "will add the given client object to the clients table" do
      client_test = Client.new({:name => "pedro", :stylist_id => '3'})
      client_test.save()
      expect(Client.all()).to(eq([client_test]))
    end
  end
  describe('#==') do
    it "tests to see if two seperate objects have the same properties" do
      client_test1 = Client.new({:name => "peter", :stylist_id => '2'})
      client_test2 = Client.new({:name => "peter", :stylist_id => '2'})
      expect(client_test1).to(eq(client_test2))
    end
  end
  describe('#update') do
    it "updates the name and stylist id properties of a selected client" do
      client_test = Client.new({:name => "peter", :stylist_id => '2'})
      client_test.save()
      client_test.update('patron', 4)
      client_test2 = Client.new({:name => "patron", :stylist_id => '4'})
      client_test2.save()
      expect(client_test.name()).to(eq(client_test2.name()))
    end
  end
  describe('#delete') do
    it "deletes a selected client from the clients table" do
      client_test = Client.new({:name => "pedro", :stylist_id => '3'})
      client_test2 = Client.new({:name => "peter", :stylist_id => '2'})
      client_test.save()
      client_test2.save()
      client_test.delete()
      expect(Client.all()).to(eq([client_test2]))
    end
  end
end
