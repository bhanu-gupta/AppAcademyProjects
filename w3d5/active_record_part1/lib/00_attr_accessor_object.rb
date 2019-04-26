class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) { 
       instance_variable_get("@#{name}") 
      }
      define_method("#{name}=") do |new_name|
        instance_variable_set("@#{name}",new_name)
        return new_name
      end
    end
  end
end
