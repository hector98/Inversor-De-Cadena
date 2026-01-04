# lib/exceptions/invalid_string_error.rb

module Exceptions
  class InvalidStringError < StandardError
    attr_reader :input, :error_code

    def initialize(input, message = "Invalid String", error_code = :invalid_string)
      @input = input
      @error_code = error_code
      super("#{message}: #{input}")
    end
  end

  class NilStringError < InvalidStringError
    def initialize(input)
      super (input, "Not nil string", :nil_string)
    end
  end
end
