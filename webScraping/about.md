<h2>latestNews.rb</h2> 
-scraper for a few websites I regularly check ^_^   

-A couple things I learned:    
* the Scraper tool for Chrome is super awesome!! I used it to get the xpath for the links I was interested in.    
* however, watch out for 'tbody', which shows up in the xpath shown by the Scraper tool. when you actually put in the xpath in your code, the tbody should be removed (or else nothing will be outputted).
* to access multiple elements of the same type (i.e. multiple anchor elements), the xpath (i.e. //li/a..) should be wrapped in parentheses, which then can be accessed via index (i.e. (//li/a)[0]) to get a specific anchor.
* there are a few dependencies: "open-uri", 'openssl', "open_uri_redirections", and "nokogiri".    
    

