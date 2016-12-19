require 'open-uri'
require 'down'
require 'pdf-reader'
require 'mailgun'
require 'nokogiri'

def get_pdf_url(from_url)
	doc = Nokogiri::HTML(open(from_url))
	urls = doc.css('a').map{|a| a.attributes["href"].value rescue next}
	pdf_urls = urls.select{|url| url.split('.').last == 'pdf' rescue false}
	return pdf_urls.first
end

def search(search_name, search_url, search_text)

	pdf_tempfile = Down.download(search_url)

	begin
		File.open(pdf_tempfile, 'rb') do |io|
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

				mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
			end
		end
	ensure
		pdf_tempfile.close
		pdf_tempfile.unlink
	end

end