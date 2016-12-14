begin
  require 'pi-lights-control'
rescue LoadError
  puts 'WARNING: pi-lights-control unavailable, using dummy module'
  require 'dummy-lights-control'
end

class LightsControl
  VALID_ACTIONS = %w(ON SYNC OFF PROGRAM#1 PROGRAM#2 PROGRAM#3 PROGRAM#4
                     PROGRAM#5 PROGRAM#6 PROGRAM#7 PROGRAM#8)

  PROGRAM_MAP = {
    1 => :combination,
    2 => :steady,
    3 => :slow_blink,
    4 => :fast_blink,
    5 => :slow_fade,
    6 => :fast_fade,
    7 => :blink_steady,
    8 => :step_fade
  }

  def self.is_valid_action? action
    VALID_ACTIONS.include? action
  end

  def self.send_command action
    if !is_valid_action? action
      false
    else
      c = PiLightsControl::Command.new(ENV['GPIO_PIN'])
      case action
      when "ON"
        c.power_on
      when "SYNC"
        c.sync_lights
      when "OFF"
        c.power_off
      when /PROGRAM#(\d)/
        c.program(PROGRAM_MAP[$1])
      else
        false
      end
    end
  end
end
