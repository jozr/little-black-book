require './lib/contact.rb'
require './lib/address.rb'
require './lib/email.rb'
require './lib/phone.rb'

  def main_menu
    loop do
      puts "Press 'c' to create a new contact."
      puts "Press 'x' to exit."
      puts "Press 'a' to add an address"
      puts "Press 'v' to view a contact"
      main_choice = gets.chomp
      if main_choice == 'c'
        add_contact
      elsif main_choice == 'a'
        add_address
      elsif main_choice == 'v'
        view_contact
      elsif main_choice == 'x'
        exit
      end
    end
  end

  def add_contact
    puts 'What is the name of this contact?'
    input_add_contact = gets.chomp
    Contact.new(input_add_contact).save
    puts "#{input_add_contact} added."
  end

  def add_address
    puts 'Choose a contact to add address to'

    Contact.all.each do |looplord|
      puts looplord.name
    end

    contact_input = gets.chomp
    Contact.all.each do |looplord|
      if contact_input = looplord
        puts 'Enter the street.'
        input_street = gets.chomp
        puts 'Enter the city.'
        input_city = gets.chomp
        puts 'Enter the state.'
        input_state = gets.chomp
        puts 'Enter the zip code.'
        input_zip = gets.chomp
        Address.new(input_street, input_city, input_state, input_zip).save
      end
    end
  end

  def view_contact
    puts "What contact would you like to view?"
    Contact.all.each do |looplord|
      puts looplord.name
    end

    user_input = gets.chomp
    Contact.all.each do |looplord|
      if looplord == user_input
        puts looplord.name
      end
    end
  end

  main_menu
