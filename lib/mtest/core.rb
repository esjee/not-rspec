require 'active_support/all'

Dir[File.dirname(__FILE__) + '/core/*.rb'].each { |filename| require filename }
