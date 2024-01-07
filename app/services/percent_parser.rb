class PercentParser
  def initialize(raw_data)
    @parser = CsvParser.new(raw_data, ' % ')
  end

  def people
    @parser.rows.map do |row|
      Person.new(
        first_name: row['first_name'],
        city: row['city'],
        last_name: nil,
        birthdate: Date.strptime(row['birthdate'], '%Y-%m-%d'),
      )
    end
  end
end
