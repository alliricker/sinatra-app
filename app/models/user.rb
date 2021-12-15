require_relative './concerns/slugifiable.rb'

class User < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_secure_password
  has_many :books

  validates :username, uniqueness: true 
  validates :email, uniqueness: true
  validates :password, presence: true
end
