# lib/services/verifier.rb

require_relative '../core/string'
require_relative '../core/result'

module Services
  class Verifier
    class << self


      def verify(input, metadatos={})
        string = input.is_a?(Core::String) ? input : Core::String.new(input)

        Core::Result.new(
          string: string.input,
          inverse_string: string.inverse_string,
          metadatos: metadatos.merge(process_for: self.class.name)
        )
    end
  end
end
