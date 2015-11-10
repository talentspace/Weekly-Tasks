 require 'json'
 require 'open-uri'
puts"Hello,Enter the movie name:\n"
usr_input=gets.chomp
usr_input=usr_input.split(" ")# Check whether the entered movie is more than one word
usr_input=usr_input.join("+")#If yes,add + in between the words.
movie_url= "http://www.omdbapi.com/?t=#{usr_input}&y=&plot=short&r=json"
content = open(movie_url).read
content_hash=JSON.parse(content)
html_file=File.new("movie_detail.html","w")
new_line = "\n"
html_file.puts("<!DOCTYPE html>"+new_line)
html_file.puts("<head>"+new_line)
html_file.puts("<title>#{content_hash["Title"]}</title>"+new_line)
html_file.puts("</head>"+new_line)
html_file.puts("<body style=background-color:#59B791>"+new_line)
html_file.puts("<h1 style=text-align:center>#{content_hash["Title"]}</h1>"+new_line)
html_file.puts("<IMG SRC=#{content_hash["Poster"]}>")
html_file.puts("<h2>Genre:#{content_hash["Genre"]}</h2>"+new_line)
html_file.puts("<h2>Actors:#{content_hash["Actors"]}</h2>"+new_line)
html_file.puts("<p>Plot:#{content_hash["Plot"]}</p>"+new_line)
html_file.puts("<h4>IMDB Rating:#{content_hash["imdbRating"]}</h4>"+new_line)
html_file.puts("</body>"+new_line)
html_file.puts("</html>"+new_line)
html_file.close




