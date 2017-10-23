class Api::V1::HighlightsController < ApplicationController

  def get_highlights
      reddit_posts_response = RestClient.get('http://www.reddit.com/r/nba.json')
      parsed_posts = JSON.parse(reddit_posts_response)

      next_page_id = parsed_posts["data"]["after"]

      highlights = parsed_posts["data"]["children"].select {|post| post["data"]["link_flair_css_class"] == "highlights" && !post["data"]["media_embed"]["content"].nil?}

      highlights.each do |highlight|
        Highlight.create(
          title: highlight["data"]["title"],
          date_created: DateTime.strptime("#{highlight["data"]["created_utc"]}",'%s'),
          media: highlight["data"]["media_embed"]["content"],
          permalink: "https://www.reddit.com#{highlight["data"]["permalink"]}",
          url: highlight["data"]["url"]
        )
      end

      # order persisted highlghts by the date they were created on reddit
      highlights_to_send = Highlight.all.order(date_created: :desc)

      render json: {highlights: highlights_to_send}
  end

end
