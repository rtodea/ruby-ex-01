require 'spec_helper'

RSpec.describe PercentParser do
  subject { described_class.new(data) }

  describe '#people' do
    let(:data) { File.read('spec/fixtures/people_by_percent.txt') }

    it 'returns an array of parsed Person objects' do
      expect(subject.people).to match_array([
        have_attributes(
          class: Person,
          first_name: 'Mckayla',
          last_name: nil,
          city: 'Atlanta',
          birthdate: Date.new(1986, 5, 29),
        ),
        have_attributes(
          class: Person,
          first_name: 'Elliot',
          last_name: nil,
          city: 'New York City',
          birthdate: Date.new(1947, 5, 4),
        ),
      ])
    end

    context 'when no data is provided' do
      let(:data) { nil }

      it 'returns an empty array' do
        expect(subject.people).to eq([])
      end
    end
  end
end
