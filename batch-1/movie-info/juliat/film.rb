require 'json'
require 'open-uri'

puts "Pleaes, Enter a film"
film_name = gets.chomp
film_name = film_name.split(" ")
film_name = film_name.join("+")
req_url = "http://www.omdbapi.com/?t=" + film_name +"&y=&plot=short&r=json"
request_query = ''
url = "#{req_url}#{request_query}"
buffer = open(url).read
web_content = JSON.parse(buffer)

myfile = File.new("#{web_content["Title"]}.html", "w+")
myfile.puts "<html>"
myfile.puts "<head>"
myfile.puts "<title>#{web_content["Title"]}</title>"
myfile.puts "</head>"
myfile.puts "<body>"
myfile.puts "<div id=\"main\">"
myfile.puts "<h1 style=text-align:center>#{web_content["Title"]}</h1>"
myfile.puts "<hr>"
myfile.puts "</div>"

myfile.puts "<div id=\"left_side\" style=float:left;width:30%>"
myfile.puts "<img src=\"#{web_content["Poster"]}\" border=\"0\">"
myfile.puts "</div>"

myfile.puts "<div id=\"right_side\" style=float:right;width:68%>"
myfile.puts("<h2 style=color:#6C6C6C>Genre:#{web_content["Genre"]}</h2>")
myfile.puts("<h2 style=color:#6C6C6C>Actors:#{web_content["Actors"]}</h2>")
myfile.puts("<p style=color:#A1A1A1>Plot:#{web_content["Plot"]}</p>")
myfile.puts "<hr>"
myfile.puts("<h4>IMDB Rating:#{web_content["imdbRating"]}</h4>")
myfile.puts "</div>"

myfile.puts "</body>"
myfile.puts "</html>"
myfile.close

