#practicing scraping with ruby
#open is a method in the Kernel class
#open is a method in the File class

=begin
this web scraper asks for a wikipedia page name and then lists the table of contents for that page
=end

require "open-uri"
require 'openssl'
require "open_uri_redirections"
require "nokogiri"

base_url = "http://en.wikipedia.org/wiki/"

puts "please enter a query (i.e. 'fruit')"
page_name = gets.chomp 

page_data = open(base_url + page_name, :allow_redirections => :all, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read

doc = Nokogiri::HTML(open(base_url + page_name, :allow_redirections => :all, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
list = []
doc.xpath('//ul/li[starts-with(@class, "toclevel-2")]').each {|li| list.push(li.text)}
puts list



=begin
my_file = open(page_name + "_wikiPage", "w")

my_file.write(page_data)
my_file.close()
=end

puts "done!"



#puts open(base_url + page_name, :allow_redirections => :all, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read

