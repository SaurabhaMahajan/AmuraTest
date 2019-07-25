class User
  attr_accessor :status
  ["active", "inactive", "pending"].each do |method_name|
    define_method "#{method_name}?" do 
      return self.status == method_name
    end
  end
end

@user = User.new
@user.status = "inactive"
@user.active?
@user.inactive?
