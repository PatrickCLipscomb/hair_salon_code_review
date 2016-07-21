require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it "will return an array of all the objects in the database" do
      stylist_test = Stylist.new({:name => "pedro"})
      stylist_test2 = Stylist.new({:name => "peter"})
      stylist_test.save()
      stylist_test2.save()
      expect(Stylist.all()).to(eq([stylist_test, stylist_test2]))
    end
  end
  describe('#save') do
    it "will add the given stylist object to the stylists database" do
      stylist_test = Stylist.new({:name => "pedro"})
      stylist_test.save()
      expect(Stylist.all()).to(eq([stylist_test]))
    end
  end
  describe('#==') do
    it "tests to see if two seperate objects have the same properties" do
      stylist_test1 = Stylist.new({:name => "peter"})
      stylist_test2 = Stylist.new({:name => "peter"})
      expect(stylist_test1).to(eq(stylist_test2))
    end
  end
  describe('#update') do
    it "updates the name property of a selected stylist" do
      stylist_test = Stylist.new({:name => "peter"})
      stylist_test.save()
      stylist_test.update('patron')
      stylist_test2 = Stylist.new({:name => "patron"})
      stylist_test2.save()
      expect(stylist_test.name()).to(eq(stylist_test2.name()))
    end
  end
  describe('#delete') do
    it "deletes a selected stylist from the stylists table" do
      stylist_test = Stylist.new({:name => "pedro"})
      stylist_test2 = Stylist.new({:name => "peter"})
      stylist_test.save()
      stylist_test2.save()
      stylist_test.delete()
      expect(Stylist.all()).to(eq([stylist_test2]))
    end
  end
  describe('#find_by_name') do
    it "finds a selected stylist via the stylist's id" do
      stylist_test = Stylist.new({:name => "pedro"})
      stylist_test2 = Stylist.new({:name => "peter"})
      stylist_test.save()
      stylist_test2.save()
      expect(Stylist.find_by_name('pedro')).to(eq(stylist_test))
    end
  end
  describe('#find_by_id') do
    it "finds a selected stylist via the stylist's id" do
      stylist_test = Stylist.new({:name => "pedro"})
      stylist_test2 = Stylist.new({:name => "peter"})
      stylist_test.save()
      stylist_test2.save()
      expect(Stylist.find_by_id(stylist_test.id())).to(eq(stylist_test))
    end
  end
end
