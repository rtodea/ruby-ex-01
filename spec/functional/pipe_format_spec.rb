require 'spec_helper'

RSpec.describe 'App Functional Test - Pipe' do
  describe 'pipe format sorted by first_name' do
    let(:params) do
      {
        pipe_format: File.read('spec/fixtures/people_by_pipe.txt'),
        order: :first_name,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(normalized_people).to eq \
        [
          'Jane, , Denver, 1/15/1995',
          'Joseph, , New York City, 10/24/1990',
        ]
    end
  end
end
