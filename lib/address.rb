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

  def edit_city(edited_city)
    @city = edited_city
  end

  def edit_state(edited_state)
    @state = edited_state
  end

  def edit_zip(edited_zip)
    @zip = edited_zip
  end

  def delete_street
    @street = []
  end

  def delete_city
    @city = []
  end

  def delete_state
    @state = []
  end

  def delete_zip
    @zip = []
  end
end
