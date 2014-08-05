require 'rspec'
require 'address'
require 'email'
require 'phone'
require 'contact'

describe Contact do
  before do
    Contact.clear
  end

  it 'is initialized with a name' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.should be_an_instance_of Contact
  end

  it 'allows users to add multiple contacts' do
    new_contact = Contact.new 'John Doe'
    new_contact.save
    new_contact_two = Contact.new 'Jane Doe'
    new_contact_two.save
    Contact.all.should eq [new_contact, new_contact_two]
  end

  it 'allows users to edit contact name' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_contact.edit_name 'Jane Auschwitz'
    test_contact.name.should eq 'Jane Auschwitz'
  end

  it 'allows users to delete a contact' do
    test_contact = Contact.new 'Quinn'
    test_contact.save
    test_contact.delete
    Contact.all.should eq []
  end

describe '.search' do
  it 'allows user to search for a specific contact' do
    test_contact = Contact.new 'Sharon Needles'
    test_contact.save
    Contact.search('Sharon Needles').should eq test_contact
  end
end

  describe '.all' do
    it 'starts as an empty array' do
      Contact.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all contacts' do
      Contact.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds a contact to the array of contacts' do
      test_contact = Contact.new 'Jane Doe'
      test_contact.save
      Contact.all.should eq [test_contact]
    end
  end

  it 'adds an address to a contact' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
    test_address.save
    test_contact.add_address(test_address)
    test_contact.addresses.should eq [test_address]
  end

  it 'adds multiple addresses' do
    test_contact = Contact.new 'John Doe'
    test_contact.save
    test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
    test_address_two = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '12345'
    test_contact.add_address(test_address)
    test_contact.add_address(test_address_two)
    test_contact.addresses.should eq [test_address, test_address_two]
  end

  it 'allows user to edit the street in a contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.edit_street '234 Main St.'
    test_address.street.should eq '234 Main St.'
  end

  it 'allows user to edit the city in a contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.edit_city 'Boring'
    test_address.city.should eq 'Boring'
  end

  it 'allows user to edit the state in a contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.edit_state 'Washington'
    test_address.state.should eq 'Washington'
  end

  it 'allows user to edit the zip code in a contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.edit_zip '48124'
    test_address.zip.should eq '48124'
  end

  it 'allows user to delete the street in a contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.delete_street
    test_address.street.should eq []
  end

  it 'allows user to delete a city in the contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.delete_city
    test_address.city.should eq []
  end

  it 'allows user to delete a state in the contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.delete_state
    test_address.state.should eq []
  end

  it 'allows user to delete a zip code in the contact address' do
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.delete_zip
    test_address.zip.should eq []
  end

  it 'adds an email address to a contact' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_email = Email.new 'janedoe@gmail.com'
    test_email.save
    test_contact.add_email(test_email)
    test_contact.emails.should eq [test_email]
  end

  it 'allows user to edit a contact email' do
    test_email = Email.new 'janedoe@gmail.com'
    test_email.edit_email 'janedoe@aol.com'
    test_email.email_input.should eq 'janedoe@aol.com'
  end

  it 'allows user to delete an email address' do
    test_email = Email.new 'chernoble@fun.com'
    test_email.delete_email
    test_email.email_input.should eq []
  end

  it 'adds multiple emails' do
    test_contact = Contact.new 'John Doe'
    test_contact.save
    test_email = Email.new 'janedoe@gmail.com'
    test_email_two = Email.new 'johndoe@gmail.com'
    test_contact.add_email(test_email)
    test_contact.add_email(test_email_two)
    test_contact.emails.should eq [test_email, test_email_two]
  end

  it 'adds a phone number to a contact' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_phone = Phone.new '503-333-3333', '222'
    test_phone.save
    test_contact.add_phone(test_phone)
    test_contact.phones.should eq [test_phone]
  end

  it 'allows user to edit a contact phone number' do
    test_phone = Phone.new '503-333-3333', '333'
    test_phone.edit_phone_number '504-444-4444'
    test_phone.phone_number.should eq '504-444-4444'
  end

  it 'allows user to edit a phone extension' do
    test_phone = Phone.new '503-333-3333', '333'
    test_phone.edit_extension '124'
    test_phone.extension.should eq '124'
  end

  it 'allows user to delete a phone number' do
    test_phone = Phone.new '313-666-6660', '616'
    test_phone.delete_number
    test_phone.phone_number.should eq []
  end

  it 'allows user to delete an extension' do
    test_phone = Phone.new '313-666-6660', '666'
    test_phone.delete_extension
    test_phone.extension.should eq []
  end

  it 'adds multiple phone numbers' do
    test_contact = Contact.new 'John Doe'
    test_contact.save
    test_phone = Phone.new '313-123-5678', '123'
    test_phone_two = Phone.new '313-123-5678', '124'
    test_contact.add_phone(test_phone)
    test_contact.add_phone(test_phone_two)
    test_contact.phones.should eq [test_phone, test_phone_two]
  end
end


describe Address do
  before do
    Address.clear
  end

  it 'is initialized with an address' do
    test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
    test_address.should be_an_instance_of Address
  end

  describe '.all' do
    it 'starts as an empty array' do
      Address.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all addresses' do
      Address.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds an address to the array of addresses' do
      test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
      test_address.save
      Address.all.should eq [test_address]
    end
  end
end

describe Email do
  before do
    Email.clear
  end

  it 'is initialized with an email' do
    test_email = Email.new 'janedoe@gmail.com'
    test_email.should be_an_instance_of Email
  end

  describe '.all' do
    it 'starts as an empty array' do
      Email.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all emails' do
      Email.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds an email to the array of emails' do
      test_email = Email.new 'janedoe@gmail.com'
      test_email.save
      Email.all.should eq [test_email]
    end
  end
end

describe Phone do
  before do
    Phone.clear
  end

  it 'is initialized with a name' do
    test_phone = Phone.new '503-333-3333', '123'
    test_phone.should be_an_instance_of Phone
  end

  describe '.all' do
    it 'starts as an empty array' do
      Phone.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all phone numbers' do
      Phone.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds a phone number to the array of phone numbers' do
      test_phone = Phone.new '123-456-7891', '123'
      test_phone.save
      Phone.all.should eq [test_phone]
    end
  end
end

