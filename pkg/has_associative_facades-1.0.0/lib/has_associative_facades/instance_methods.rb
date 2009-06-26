module HasAssociativeFacades
  module InstanceMethods
    
    # When the method being called is the case of "#{association_name}_#{attribute_or_method}" a getter method 
    # will be defined and called returning its value.  This works for an ActiveRecord object created through the
    # new operator having all attributes set to nil or an find of some sort having all attributes populated.
    #
    # If the associated object is nil but has an attribute or method with the given name a nil is reurned.  Otherwise,
    # the NoMethodError is thrown.
    #
    def method_missing( method, *args )
      method_name = method.to_s
      super( method, *args ) # allow super to win if it has the method
    rescue NoMethodError => ex
      association = nil
      association_reflection = nil
      associateds = self.class.inheritable_attributes[:reflections]
      associateds.each do |associated|
        if /#{associated[0]}_/.match( method_name )
          association_reflection = associated
          association = associated[0]
          break
        end
      end

      if match = /#{association}_([_a-zA-Z]\w*)/.match( method_name )
        throw ex if match.captures.empty? || match.captures.size > 2
        attribute = match.captures[0].to_sym

        assoc_klass = nil
        begin
          assoc_klass = association.to_s.classify.constantize
        rescue
          assoc_klass = association_reflection[1].options[:class_name].constantize
        end
        throw ex unless assoc_klass.columns_hash.has_key?( attribute.to_s ) || assoc_klass.public_instance_methods.include?( attribute.to_s )

        self.class.class_eval <<-END
        def #{method_name}
          return self.send( :#{association} ).send( :#{attribute} ) unless self.send( :#{association} ).nil?
          nil
        end
        END

        return self.send( method_name )
      end

      throw ex
    end
    
  end
end