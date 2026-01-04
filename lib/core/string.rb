# lib/core/string.rb

require_relative '../exceptions/invalid_string_error'

module Core
  class String
    LONGEST_STRING = 255

    attr_reader :input

    # @param input [String] The string to validate
    # @return [String] The input string
    def initialize(input)
      @input = validate(input)
      freeze_input
    end

    def inverse_string
      input_reversed = ""

      @input.each_char { |char| input_reversed.prepend(char) }

      input_reversed
    end

    private

    def validate(input)
      if input.nil? || input.empty?
        raise Exceptions::EmptyStringError.new(input)
      elsif input.length > LONGEST_STRING
        raise Exceptions::TooLongStringError.new(input)
      else
        input
      end
    end

    def freeze_input
      @input.freeze
      freeze
    end
  end
end
