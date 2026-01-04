# lib/inverse_string.rb

# Princiapl module of the application
module InverseString
  VERSION = "1.1.0"

  def self.load_dependencies
    require_relative "core/string"
    require_relative "core/result"
    require_relative "services/verifier"
    require_relative "exceptions/invalid_string_error"
  end

  def self.init
    load_dependencies
    true
  end
end

# Load automatically the dependecies
InverseString.init
