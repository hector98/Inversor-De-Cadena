# frozen_string_literal: true

# lib/core/result.rb

module Core
  # Result class
  class Result
    attr_reader :string, :inverse_string, :metadatos

    # @param string [String] The string to validate
    # @param inverse_string [String] The inverse string
    # @param metadatos [Hash] The additional metadatos

    def initialize(string, inverse_string, metadatos = {})
      @string = string
      @inverse_string = inverse_string
      @metadatos = metadatos.freeze
    end

    # @return [String] A description of the result
    def description
      "String: #{string}, Inverse String: #{inverse_string}"
    end

    # @return [String] A JSON representation of the result
    def to_json(*_args)
      {
        string: @string,
        inverse_string: @inverse_string,
        metadatos: @metadatos
      }.to_json
    end

    # @return [String] A string representation of the result
    def to_s
      description
    end
  end
end
