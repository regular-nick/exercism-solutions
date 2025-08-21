module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE
  CARGOS = { :OIL => :A, :GAS => :A }
  
  def self.get_identifier(city)
    city.to_s[0, 4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.to_s[0, 3].upcase.to_sym
    CARGOS.has_key?(cargo) ? CARGOS[cargo] : :B
  end
end
