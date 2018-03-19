require 'rufus/scheduler'
scheduler = Rufus::Scheduler new

scheduler.every '10m' do
   require "net/http"
   require "uri"
   Net::HTTP.get_response(URI.parse(ENV["API_PING"]))
end
