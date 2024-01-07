require 'spec_helper'

RSpec.describe DollarParser do
  subject { described_class.new(data) }

  describe '#people' do
    let(:data) { File.read('spec/fixtures/people_by_dollar.txt') }

    it 'returns an array of parsed Person objects' do
      expect(subject.people).to match_array([
        have_attributes(
          class: Person,
          first_name: 'Rhiannon',
          last_name: 'Nolan',
          city: 'LA',
          birthdate: Date.new(1974, 4, 30),
        ),
        have_attributes(
          class: Person,
          first_name: 'Rigoberto',
          last_name: 'Bruen',
          city: 'NYC',
          birthdate: Date.new(1962, 1, 5),
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
