# spec/core/string_spec.rb

require 'spec_helper'

RSpec.describe Core::String do
  describe '#initialize' do
    context 'valid input' do
      it 'sets the value' do
        string = described_class.new('Hello')
        expect(string.input).to eq('Hello')
      end
    end
  end
end
