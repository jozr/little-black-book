require 'contact'
require 'email'
require 'phone'
class Address
  @@all_addresses = []

  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def Address.all
    @@all_addresses
  end

  def Address.clear
    @@all_addresses = []
  end

  def save
    @@all_addresses << self
  end

  def street
    @street
  end

  def city
    @city
  end

  def state
    @state
  end

  def zip
    @zip
  end

  def edit_street(edited_street)
    @street = edited_street
  end
end
