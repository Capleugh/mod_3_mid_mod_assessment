class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://www.potterapi.com/v1') do |f|
      f.adapter Faraday.default_adapter
    end

    response = conn.get("characters?key=#{ENV["HARRY_POTTER_API_KEY"]}")

    json = JSON.parse(response.body, symbolize_names: true)

    @members = json.find_all do |member|
      member[:orderOfThePhoenix] == true && member[:house] == "Gryffindor"
    end
    # require "pry"; binding.pry
  end
end
