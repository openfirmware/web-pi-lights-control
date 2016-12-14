# Dummy Module/Class that emulates pi-lights-control on unsupported platforms.

module PiLightsControl
  class Command
    attr_accessor :repeat_count
    def initialize(pin, options = {})
      @repeat_count = 6
    end

    def power_off
      true
    end

    def power_on
      true
    end

    def program(name)
      true
    end

    def sync_lights
      true
    end
  end
end
