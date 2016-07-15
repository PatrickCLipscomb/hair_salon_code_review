class Stylist
  attr_reader(:id, :name)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id] || nil
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end
  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |client|
      stylists.push(Stylist.new({
        :name => client.fetch('name'),
        :id => client.fetch('id').to_i
        }))
    end
    stylists
  end
  define_method(:==) do |another_stylist|
    (self.id == another_stylist.id) && (self.name == another_stylist.name)
  end
  define_method(:update) do |updated_name|
    @name = updated_name
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id};")
  end
  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id}")
  end
  define_singleton_method(:find_by_name) do |name|
    searched = []
    returned = Stylist.all()
    returned.each() do |stylist|
      if stylist.name == name
        searched.push(stylist)
      end
    end
    searched
  end
end
