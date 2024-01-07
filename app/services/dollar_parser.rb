class DollarParser
  def initialize(raw_data)
    @parser = CsvParser.new(raw_data, ' $ ')
  end

  def people
    @parser.rows.map do |row|
      Person.new(
        city: row['city'],
        birthdate: Date.strptime(row['birthdate'], '%d-%m-%Y'),
        first_name: row['first_name'],
        last_name: row['last_name'],
      )
    end
  end
end
