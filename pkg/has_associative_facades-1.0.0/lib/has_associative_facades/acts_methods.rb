module HasAssociativeFacades
  module ActsMethods
    
    # Use this method to declare the fassociated facade behavior on your ActiveRecord class.
    #
    def has_restful_permissions 
      unless included_modules.include? InstanceMethods
        include InstanceMethods
      end
    end
    
  end
end