# frozen_string_literal: true
module FizzBuzz
  class Checker
    attr_reader :number

    def initialize(number)
      @number = number
    end

    def fizz?
      number.modulo(3).zero?
    end

    def buzz?
      # number context: 5, 7

      # when format is 5 => true
      # when format is 7 => false
    end

    def print
      # fizz? context: true, false
      # buzz? context: true, false

      # when fizz? is true and buzz? is true => 'FizzBuzz'
      # when fizz? is true and buzz? is false => 'Fizz'
      # when fizz? is false and buzz? is true => 'Buzz'
      # when fizz? is false and buzz? is false => 13
    end
  end
end
