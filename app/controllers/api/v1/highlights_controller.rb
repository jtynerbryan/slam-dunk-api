class Api::V1::HighlightsController < ApplicationController

  def get_highlights
    # order persisted highlghts by the date they were created on reddit
      highlights_to_send = Highlight.all.order(date_created: :desc)

      #send all highlights to the frontend
      render json: {highlights: highlights_to_send}
  end

  def update_highlights
    #initial request to reddit api
    reddit_posts_response = RestClient.get(ENV['BASE_URL'])
    parsed_posts = JSON.parse(reddit_posts_response)

    # get the value of the after: in api response to get additional pages of of highlights
    next_page_id = parsed_posts["data"]["after"]

    # filter api response so that only video highlights are persisted
    highlights = parsed_posts["data"]["children"].select {|post| post["data"]["link_flair_css_class"] == "highlights" && !post["data"]["media_embed"]["content"].nil?}

    # get highlights from the five pages after r/nba's frontpage
    5.times do
      reddit_posts_response = RestClient.get("#{ENV['BASE_URL']}?after=#{next_page_id}")
      parsed_posts = JSON.parse(reddit_posts_response)

      # reset value of next_page_id in order to access the next page of posts
      next_page_id = parsed_posts["data"]["after"]

      # add highlight posts from this page to highlights array
      highlights.concat(parsed_posts["data"]["children"].select {|post| post["data"]["link_flair_css_class"] == "highlights" && !post["data"]["media_embed"]["content"].nil?})
    end

    # persist highlights, duplicates will be rejected because of unique title validation
    highlights.each do |highlight|
      Highlight.create(
        title: highlight["data"]["title"],
        date_created: DateTime.strptime("#{highlight["data"]["created_utc"]}",'%s'),
        media: highlight["data"]["media_embed"]["content"],
        permalink: "https://www.reddit.com#{highlight["data"]["permalink"]}",
        url: highlight["data"]["url"]
      )
    end

    render json: {message: "highlights updated"}
  end

end
