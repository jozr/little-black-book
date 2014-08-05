require 'rspec'
require 'address'
require 'email'
require 'phone'
require 'contact'

describe Contact do
  it 'is initialized with a name' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.should be_an_instance_of Contact
  end
end
