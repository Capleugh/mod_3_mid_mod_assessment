class SearchController < ApplicationController
  def index
    render locals: {
      members: MemberSearch.new
      
    }
    # conn = Faraday.new(url: 'https://www.potterapi.com/v1') do |f|
    #   f.adapter Faraday.default_adapter
    # end
    #
    # response = conn.get("characters?house=Gryffindor&orderOfThePhoenix=true&key=#{ENV["HARRY_POTTER_API_KEY"]}")
    #
    # json = JSON.parse(response.body, symbolize_names: true)
    #
    # @members = json
  end
end
