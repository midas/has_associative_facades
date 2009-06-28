module HasAssociativeFacades
  module ActsMethods
    
    # Use this method to declare the associated facade behavior on your ActiveRecord class.
    #
    def has_associative_facades 
      unless included_modules.include? InstanceMethods
        include InstanceMethods
      end
    end
    
  end
end