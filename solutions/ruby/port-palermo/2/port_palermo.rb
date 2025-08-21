module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE
  TERMINALS = { [:OIL, :GAS] => :A }
  DEFAULT_TERMINAL = :B
  
  def self.get_identifier(city)
    city[0, 4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.to_s[0, 3].to_sym
    TERMINALS.each do |key, value|
      return value if key.member?(cargo)
    end
    DEFAULT_TERMINAL
  end
end
