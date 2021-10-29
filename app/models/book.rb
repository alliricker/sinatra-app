require_relative './concerns/slugifiable.rb'

class Book < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :user
end
