class SearchController < ApplicationController
  def index
    house = params[:houseId]
    conn = Faraday.new(url: 'https://www.potterapi.com/v1') do |f|
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/houses/#{house}?key=#{ENV["HARRY_POTTER_API_KEY"]}")
    require "pry"; binding.pry

    json = JSON.parse(response.body, symbolize_names: true)


  end
end
