class Api::V1::HighlightsController < ApplicationController

  def get_highlights
      highlights_response = RestClient.get('http://www.reddit.com/r/nba.json')
      parsed_highlights = JSON.parse(highlights_response)

      render json: {highlights: parsed_highlights}
  end

end
