# Slam Dunk API
* Rails API for Slam Dunk, an app that displays NBA highlights uploaded to Reddit's [/r/nba](https://reddit.com/r/nba)
* Provides data and makes Reddit API calls for React front end ([repo](https://github.com/jtynerbryan/slam-dunk))
* View live site [here](https://slam-dunk.herokuapp.com) (please be patient while Heroku wakes up)

## Features
* Upon request from React front end, persists all new highlights from 5 most recent pages at /r/nba in database, then renders all highlights to front end
 * Highlight title uniqueness [validation](http://guides.rubyonrails.org/active_record_validations.html) prevents duplicates from being created
 
## Architecture
* see `app` folder for application code
* [PostreSQL](https://postgresql.org) database stores NBA highlight information
