class CsvParser
  def initialize(raw_data, separator)
    @raw_data = raw_data
    @separator = separator
  end

  def rows
    return [] if @raw_data.nil?

    CSV.parse(
      @raw_data,
      col_sep: @separator,
      headers: true,
    ) || []
  end

end
