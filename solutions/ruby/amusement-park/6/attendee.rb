class Attendee
  attr_accessor :height, :pass_id

  def initialize(height)
    self.height = height
  end

  def issue_pass!(pass_id)
    self.pass_id = pass_id
  end

  def revoke_pass!
    self.pass_id = false
  end
end
