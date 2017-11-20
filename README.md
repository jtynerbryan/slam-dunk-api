# Slam Dunk API
* Rails API for Slam Dunk, an app that displays NBA highlights uploaded to Reddit's [/r/nba](https://reddit.com/r/nba)
* Provides data and makes Reddit API calls for React front end ([repo](https://github.com/jtynerbryan/slam-dunk))
* View live site [here](https://slam-dunk.herokuapp.com) (please be patient while Heroku wakes up)

## Features
* Upon request from React front end, makes request to Reddit for all posts from 6 most recent pages at /r/nba
 * Filters posts and only persists those that contain highlight content
 * Highlight title uniqueness [validation](http://guides.rubyonrails.org/active_record_validations.html) prevents duplicates from being persisted
* Sorts all highlights based on the date they were created on Reddit before rendering to front end
 
## Architecture
* see `app` folder for application code
* [PostreSQL](https://postgresql.org) database stores NBA highlight information
