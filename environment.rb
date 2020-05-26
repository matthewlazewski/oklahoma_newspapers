
#require gems 

#require "oklahoma_newspapers/version"
require 'net/http'
require 'nokogiri'
require 'json'


#require all files 

require_relative "./lib/oklahoma_newspapers/api"
require_relative "./lib/oklahoma_newspapers/cli"
require_relative "./lib/oklahoma_newspapers/newspaper"

module OklahomaNewspapers
  class Error < StandardError; end
  # Your code goes here...
end
