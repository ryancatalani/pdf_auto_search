require 'open-uri'
require 'pdf-reader'
require 'mailgun'

def search(search_name, search_url, search_text)

	io = open(search_url)
	reader = PDF::Reader.new(io)

	text = reader.pages.map(&:text).join('').downcase
	if text.include?(search_text.downcase)
		
		mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

		message_params =  { from: ENV['EMAIL'],
		                    to:   ENV['EMAIL'],
		                    subject: "#{search_name} search found",
		                    text:    "Text '#{search_text}' found in PDF.",
		                    attachment: io
		                  }

		mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params

	end

end