require './app/services/percent_parser'
require './app/services/pipe_parser'
require './app/services/dollar_parser'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    fetch_people_from_all_parsers(params.slice(:percent_format,
                                               :dollar_format,
                                               :pipe_format))
      .then { |people| sort_people(people, params[:order]) }
      .map(&:to_s)
  end

  private

  attr_reader :params

  PARSERS = {
    percent_format: PercentParser,
    dollar_format: DollarParser,
    pipe_format: PipeParser
  }.freeze

  def fetch_people_from_all_parsers(inputs)
    people = []

    PARSERS.each do |format, parser_klass|
      people += parser_klass.new(params[format]).people if inputs[format]
    end

    people
  end

  def sort_people(people, by)
    comparisons = {
      birthdate: ->(a, b) { a.birthdate <=> b.birthdate },
      first_name: ->(a, b) { a.first_name <=> b.first_name }
    }
    sort_lambda = comparisons.fetch(by, ->(_a, _b) { 0 })

    people.sort(&sort_lambda)
  end
end
