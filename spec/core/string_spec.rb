# frozen_string_literal: true

# spec/core/string_spec.rb

require 'spec_helper'

RSpec.describe Core::String do
  describe '#initialize' do
    context 'valid input' do
      it 'sets the value' do
        string = described_class.new('Hello')
        expect(string.input).to eq('Hello')
      end

      it 'sets input limit lenght' do
        limited_string = '.' * (described_class::LONGEST_STRING - 1)
        expect(described_class.new(limited_string).input).to eq(limited_string)
      end
    end

    context 'invalid input' do
      it 'inputs an empty string' do
        expect { described_class.new('') }.to raise_error(Exceptions::EmptyStringError)
      end

      it 'input is too long' do
        string = '.' * (described_class::LONGEST_STRING + 1)
        expect { described_class.new(string) }.to raise_error(Exceptions::TooLongStringError)
      end
    end
  end
end
