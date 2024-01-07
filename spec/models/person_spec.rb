require 'spec_helper'

RSpec.describe Person do
  subject do
    described_class.new(
      first_name: 'John',
      last_name: 'Smith',
      city:,
      birthdate:,
    )
  end

  describe '#to_s' do
    let(:city) { 'Phoenix' }
    let(:birthdate) { Date.new(1990, 12, 31) }

    it 'returns string with fields separated by commas' do
      expect(subject.to_s).to eq('John, Smith, Phoenix, 12/31/1990')
    end

    context 'when city is abbreviated' do
      let(:city) { 'NYC' }

      it 'expands abbreviation to full city name' do
        expect(subject.to_s).to eq('John, Smith, New York City, 12/31/1990')
      end
    end

    context 'when birthdate month and day have less than two digits' do
      let(:birthdate) { Date.new(1990, 1, 2) }

      it 'does not include leading zeroes on month and day' do
        expect(subject.to_s).to eq('John, Smith, Phoenix, 1/2/1990')
      end
    end
  end
end
