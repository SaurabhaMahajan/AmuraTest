def get_addresses
  addresses = []
  User.all.map{|user| addresses << user.address if user.address.city.present? }
  addresses
end

# Example 2:
class Greeting
  attr_accessor :name
end

# Example 3:
def sum(x = 0, y = 0, z = 0, w = 0)
  x + y + z + w
end
