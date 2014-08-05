require 'contact'
require 'address'
require 'phone'

class Email
  @@all_emails = []

  def Email.all
    @@all_emails
  end

  def Email.clear
    @@all_emails = []
  end

  def save
    @@all_emails << self
  end

  def initialize(email_input)
    @email_input = email_input
  end

  def email_input
    @email_input
  end

  def edit_email(edited_email)
    @email_input = edited_email
  end
end
