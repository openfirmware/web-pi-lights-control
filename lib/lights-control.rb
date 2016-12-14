class LightsControl
  VALID_ACTIONS = %w(ON SYNC OFF PROGRAM#1 PROGRAM#2 PROGRAM#3 PROGRAM#4
                     PROGRAM#5 PROGRAM#6 PROGRAM#7 PROGRAM#8)

  def self.is_valid_action? action
    VALID_ACTIONS.include? action
  end

  def self.send_command action
    is_valid_action? action
  end
end
