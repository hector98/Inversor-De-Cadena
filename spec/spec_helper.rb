# frozen_string_literal: true

# spec/spec_helper.rb

require 'simplecov'
require 'colorize'
require 'rspec/benchmark'

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'

  add_group 'Core', 'lib/core'
  add_group 'Services', 'lib/services'
  add_group 'Exceptions', 'lib/exceptions'

  minimum_coverage 100
end

require_relative '../lib/inverse_string'

RSpec.configure do |config|
  # Basic RSpec configuration
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expert
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Aditional configurations
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!

  # Output format
  config.default_formatter = 'doc' if config.files_to_run.one?

  # Eject order
  config.order = :random
  Kernel.srand config.seed

  # Personalized helpers
  config.include RSpec::Benchmark::Matchers

  # Filters
  config.filter_run_excluding performance: true unless ENV['performance']

  # Hooks
  config.before(:suite) do
    puts 'Initializing test of InverseString'.magenta
  end

  config.after(:suite) do
    puts 'Finalizing test of InverseString'.green
    puts "Code cobertura: #{SimpleCov.result.covered_percent.round(2)}%".green
  end
end
