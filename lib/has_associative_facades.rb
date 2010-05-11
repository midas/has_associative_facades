$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'has_associative_facades/acts_methods'
require 'has_associative_facades/instance_methods'

module HasAssociativeFacades
  VERSION = '1.0.4'
  
  def self.included( base ) 
    base.extend ActsMethods 
  end
end

ActiveRecord::Base.send( :include, HasAssociativeFacades ) if defined?( ActiveRecord::Base )