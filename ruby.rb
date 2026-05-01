require 'sinatra'
require 'net/http'
require 'uri'
require 'json'
get '/' do
  erb :index
end

post '/result' do


text = params[:message]
text2 = params[:message2]

url = URI.parse(params[:message3])

data = {
    "embeds": [
    {
      "title": text2,
      "description": text,
      "color": 16711680
    }
  ]
}

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

req = Net::HTTP::Post.new(url.request_uri, {
  'Content-Type' => 'application/json'
})

req.body = data.to_json

http.request(req)
puts "送信したよ"
erb :result
end
