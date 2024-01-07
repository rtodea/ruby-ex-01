
class Person
  BIRTHDATE_FORMAT = '%-m/%-d/%Y'
  CITY_ABBREVIATIONS = {
    'NYC' => 'New York City',
    'LA' => 'Los Angeles',
  }.freeze

  attr_reader :first_name, :last_name, :birthdate, :city

  def initialize(first_name:, last_name:, birthdate:, city:)
    @first_name = first_name
    @last_name = last_name
    @birthdate = birthdate
    @city = city
  end

  def to_s
    first_name + ', ' + formatted_city + ', ' + formatted_birthdate
  end

  private

  def formatted_birthdate
    birthdate.strftime(BIRTHDATE_FORMAT)
  end

  def formatted_city
    if CITY_ABBREVIATIONS.key?(city)
      return CITY_ABBREVIATIONS[city]
    end

    city
  end
end
