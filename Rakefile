require_relative 'search'

task :search, [:search_name, :search_url, :search_text] do |t, args|
	search(args.search_name, args.search_url, args.search_text)
end

task :get_url_and_search, [:search_name, :from_url, :search_text] do |t, args|
	search_url = get_pdf_url(args.from_url)
	search(args.search_name, search_url, args.search_text)
end