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

  describe '.all' do
    it 'starts as an empty array' do
      Contact.all.should eq []
    end
  end
end

describe Address do
  it 'is initialized with an address' do
    test_address = Address.new '123 Main St.'
    test_address.should be_an_instance_of Address
  end
end

describe Email do
  it 'is initialized with an email' do
    test_email = Email.new 'janedoe@gmail.com'
    test_email.should be_an_instance_of Email
  end
end

describe Phone do
  it 'is initialized with a name' do
    test_phone = Phone.new '503-333-3333'
    test_phone.should be_an_instance_of Phone
  end
end

