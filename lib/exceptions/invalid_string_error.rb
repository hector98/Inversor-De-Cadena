# frozen_string_literal: true

# lib/exceptions/invalid_string_error.rb

module Exceptions
  # InvalidStringError
  class InvalidStringError < StandardError
    attr_reader :input, :error_code

    def initialize(input, message = 'Invalid String', error_code = :invalid_string)
      @input = input
      @error_code = error_code
      super("#{message}: #{input}")
    end
  end

  # EmptyStringError
  class EmptyStringError < InvalidStringError
    def initialize(input)
      super(input, 'Not an empty string', :empty_string)
    end
  end

  # TooLongStringError
  class TooLongStringError < InvalidStringError
    def initialize(input)
      super(input, 'Too long string', :too_long_string)
    end
  end
end
