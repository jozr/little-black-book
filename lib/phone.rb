require 'contact'
require 'email'
require 'address'

class Phone
  @@all_phones = []

  def Phone.all
    @@all_phones
  end

  def initialize(phone_input)
    @phone_input = phone_input
  end

  def phone_input
    @phone_input
  end
end
