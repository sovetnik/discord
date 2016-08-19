# frozen_string_literal: true
module FizzBuzz
  class Checker
    attr_reader :number

    def initialize(number)
      @number = number
    end

    def fizz?
      number.modulo(3).zero?
      # undefined => number
    end

    # context number
    def buzz?
      # undefined => format
    end

    # => true
    # => false
    # context format
    def print
      fizz?.Checker
      # => false
      # => true
      buzz?.Checker
      # => true
      # => false
    end

    # context fizz bool
    # context buzz bool
  end
end
