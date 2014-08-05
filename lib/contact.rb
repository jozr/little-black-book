require 'address'
require 'email'
require 'phone'

class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def save
    @@all_contacts << self
  end

  def initialize(contact_input)
    @name = name
  end

  def name
    @name
  end

end
