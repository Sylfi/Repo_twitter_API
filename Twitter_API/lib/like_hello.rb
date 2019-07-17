require 'twitter'
require 'pry'

require 'dotenv'# Appelle la gem Dotenv

Dotenv.load('../.env')

# quelques lignes qui appellent les clés d'API de ton fichier .env
client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

array = []
client.search('#bonjour_monde').take(25).each { |tweet| array << tweet.inspect }
array.each{ |s| s['#<Twitter::Tweet id='] = '' }
array.each{ |s| s['>'] = '' }
array.each{ |a| client.favorite(a)}

