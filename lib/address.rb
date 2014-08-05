require 'contact'
require 'email'
require 'phone'

class Address
  @@all_addresses = []

  def Address.all
    @@all_addresses
  end

  def initialize(address_input)
    @address = address
  end

  def address
    @address
  end
end
