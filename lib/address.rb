require 'contact'
require 'email'
require 'phone'

class Address
  @@all_addresses = []

  def Address.all
    @@all_addresses
  end

  def Address.clear
    @@all_addresses = []
  end

  def save
    @@all_addresses << self
  end

  def initialize(address_input)
    @address = address
  end

  def address
    @address
  end
end
