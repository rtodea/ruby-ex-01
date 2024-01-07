# frozen_string_literal: true

class PipeParser
  def initialize(raw_data)
    @parser = CsvParser.new(raw_data, ' | ')
  end

  def people
    @parser.rows.map do |row|
      Person.new(
        birthdate: Date.strptime(row['birthdate'],
                                 '%m.%d.%Y'),
        first_name: row['first_name'],
        city: row['city'],
        last_name: nil,
      )
    end
  end
end
