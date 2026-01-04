# lib/services/verifier.rb

require_relative '../core/string'
require_relative '../core/result'

module Services
  class Verifier
    class << self


      def verify(input, metadatos={})
        string = input.is_a?(Core::String) ? input : Core::String.new(input)
        puts "Verifier: #{string.input} -> #{string.inverse_string}"

        Core::Result.new(string.input, string.inverse_string, metadatos)
      end
    end
  end
end
