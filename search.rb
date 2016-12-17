require 'open-uri'
require 'pdf-reader'

search_url = ""
search_text = ""

io = open(search_url)
reader = PDF::Reader.new(io)

text = reader.pages.map(&:text).join('').downcase
if text.include?(search_text.downcase)
	# email
else
	# do nothing
end