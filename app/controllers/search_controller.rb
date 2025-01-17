class SearchController < ApplicationController
  def index
    all_info = fetch_nation_info(format_query_param(nation_param))
    @total_population = all_info.count
    @nation_info = all_info[0..24]
  end

  private

  def format_query_param(param)
    f = param.gsub('_', '+')
  end

  def nation_param
    params.permit(:nation)[:nation]
  end

  def fetch_nation_info(nation)
    response = connection.get("v1/characters?affiliation=#{nation}&perPage=100&page=1")
    body = JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    @connection ||= Faraday.new(
      url: 'https://last-airbender-api.herokuapp.com/api'
    )
  end
end
