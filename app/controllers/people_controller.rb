class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people = PercentParser.new(params[:percent_format]).people
    people += DollarParser.new(params[:dollar_format]).people

    people.sort! do |person_a, person_b|
      person_a.first_name <=> person_b.first_name
    end

    result = []
    people.each do |person|
      result << person.to_s
    end

    result
  end
  
  private
  
  attr_reader :params
end
