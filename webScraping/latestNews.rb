#practicing scraping with ruby
#open is a method in the Kernel class
#open is a method in the File class

require "open-uri"
require "openssl"
require "open_uri_redirections"
require "nokogiri"
require "time"

base_url = "http://www.trumpetherald.com"
base_url2 = "http://www.cnn.com"
base_url3 = "http://en.rocketnews24.com"
base_url4 = "http://www.animenewsnetwork.com/"

#page_data = open(base_url, :allow_redirections => :all, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read
#doc = Nokogiri::HTML(open(base_url, :allow_redirections => :all, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

doc = Nokogiri::HTML(open(base_url))
doc2 = Nokogiri::HTML(open(base_url2))
doc3 = Nokogiri::HTML(open(base_url3))
doc4 = Nokogiri::HTML(open(base_url4))


latestNews = "lastestNews.html"
file = File.open(latestNews, "w") #makes a new file called latestNews and writes to it

#set up html elements
file.puts "<!DOCTYPE html>"
file.puts "\n <html>"
file.puts "<head> \n <title> new news </title> \n <meta charset=\"utf-8\"> \n "
file.puts '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">'
file.puts "</head>"

file.puts "<style>"
file.puts "a {text-decoration: none}"
file.puts "</style>"

file.puts "\n <body>"
file.puts "<p>" +  Time.now.httpdate + "</p>"

file.puts "<div id='trumpetHerald'>"
file.puts "<h2><b> latest trumpet herald topics </b></h2>"
#for trumpetherald (indexing for elements starts at 1 !!)
for i in 1..10
    newPath = '(//td[1]/table[1]/tr/td/a)[' + i.to_s + ']'
    recentTopic = doc.xpath(newPath)
	urlPath = newPath + '/@href'
	url = base_url + doc.xpath(urlPath).text
	file.puts "<p><a href=\"" + url + "\" target=\"_blank\">" + recentTopic.text + "</a><\p>"
end
file.puts "</div>"

#for CNN
file.puts "<div id='CNN'>"
file.puts "<h2><b> latest news on CNN </b></h2>"
#puts "list of recent CNN news topics"
for i in 1..13
	#for some reason, for the 4th part of the path (div[2]) seems to vary between 2 or 3. 
	#use an if/else to find the right one
	testPath = '//section[1]/div[2]/div/div[2]/ul/li[1]/article/div/div/h3/a/span'
	if doc2.xpath(testPath).text === ""
		newPath = '//section[1]/div[2]/div/div[3]/ul/li[' + i.to_s + ']/article/div/div/h3/a/span'
		urlPath = '//section[1]/div[2]/div/div[3]/ul/li[' + i.to_s + ']/article/div/div/h3/a' + '/@href'
	else
		newPath = '//section[1]/div[2]/div/div[2]/ul/li[' + i.to_s + ']/article/div/div/h3/a/span'
		urlPath = '//section[1]/div[2]/div/div[2]/ul/li[' + i.to_s + ']/article/div/div/h3/a' + '/@href'
	end
	recentNewsCNN = doc2.xpath(newPath)
	url = base_url2 + doc2.xpath(urlPath).text
	
	#found a weird case where the @href was the whole url, i.e. http://www.cnn.....
	#in this case, just make the doc2.xpath(urlPath).text be the url
	if (doc2.xpath(urlPath).text)[0..3] == "http"
		url =  doc2.xpath(urlPath).text
	end
	
	file.puts "<p><a href=\"" + url + "\" target=\"_blank\">"  + recentNewsCNN.text + "</a></p>"
end 
file.puts "</div>"


#for rocketnews24
file.puts "<div id='rocketnews'>"
file.puts "<h2><b> recent rocketnews articles </b></h2>"
for i in 1..10
	recentNewsRN = doc3.xpath('(//h2/a)[' + i.to_s + ']') #for this one, wrap the base xpath (//h2/a) in parentheses, and then access the children via index.
	url = doc3.xpath('(//h2/a/@href)[' + i.to_s + ']').text
	file.puts "<p><a href=\"" + url + "\" target=\"_blank\">"  + recentNewsRN.text + "</a></p>"
end
file.puts "</div>"


#for anime news network
file.puts "<div id='ANN'>"
file.puts "<h2><b> latest news from AnimeNewsNetwork </b></h2>"
for i in 1..10
	newPath = '(//div[3]/div[3]/div/div/div/div/h3)'
	recentANN = doc4.xpath(newPath + "[" + i.to_s + "]").text
	url = doc4.xpath(newPath + "[" + i.to_s + " ]" + "/a/@href").text
	file.puts "<p><a href=\"" + base_url4 + url + "\"" + " target=\"_blank\">" + recentANN + "</a></p>"
end
file.puts "</div>"
	
#end here
file.puts "</body>"
file.puts "</html>"

file.close
puts "done!"

