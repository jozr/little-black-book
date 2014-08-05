require 'contact'
require 'email'
require 'address'

class Phone
  @@all_phones = []

  def Phone.all
    @@all_phones
  end

  def Phone.clear
    @@all_phones = []
  end

  def save
    @@all_phones << self
  end

  def initialize(phone_number, extension)
    @phone_number = phone_number
  end

  def phone_number
    @phone_number
  end

  def extension
    @extension
  end
end
