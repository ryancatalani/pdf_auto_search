require 'open-uri'
require 'pdf-reader'
require 'mailgun'

def search(search_name, search_url, search_text)

	io = open(search_url)
	begin
		reader = PDF::Reader.new(io)

		text = reader.pages.map(&:text).join('').downcase
		if text.include?(search_text.downcase)
			
			subj_date = Time.now.strftime('%b %e %Y')
			file_date = Time.now.strftime('%Y%m%d')
			file_name = search_name.gsub(/\W/,'_').downcase + "_#{file_date}"

			mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

			message_params =  { from: ENV['EMAIL'],
			                    to:   ENV['EMAIL'],
			                    subject: "#{search_name} search found",
			                    text:    "Text '#{search_text}' found in PDF. Link: #{search_url}"			                  }

			mg_client.send_message ENV['MAILGUN_DOMAIN'], mb

		end
	ensure
		io.close
		io.unlink
	end

end