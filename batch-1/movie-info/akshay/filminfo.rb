require 'open-uri'
require 'json'



def input
	puts"Movie title:"
	movie_name=gets.chomp
	movie_name=movie_name.split(" ").join("+")
	return movie_name
end

def generate_page movie_name
	movie_url= "http://www.omdbapi.com/?t=#{movie_name}&y=&plot=short&r=json"
	content = open(movie_url).read
	content_hash=JSON.parse(content)
	html_file=File.new("movie_detail.html","w")
	html_file.puts("<!DOCTYPE html>")
	html_file.puts("<head>")
	html_file.puts("<title>#{content_hash["Title"]}</title>")
	html_file.puts("<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>")
	html_file.puts("<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet' type='text/css'>")
	html_file.puts("<style>")
	html_file.puts("body{")
	html_file.puts("background-color:#C4BBF0;")
	html_file.puts("margin-top:-20px;")
	html_file.puts("}")
	html_file.puts("table td{")
	html_file.puts("style=width:100%;")
	html_file.puts("font-family:'Open Sans',sans-serif;font-size:16px;")
	html_file.puts("border-collapse: collapse;")
	html_file.puts("border: 2px solid #363B4E;")
	html_file.puts("text-align:center;")
	html_file.puts("}")
	html_file.puts("</style>")
	html_file.puts("</head>")
	html_file.puts("<body>")
	html_file.puts("<h1 style=\"position:relative;background-color:#241023;text-align:center;padding-top:25px;padding-bottom:25px;font-family:'Poppins',sans-serif;color:#FFBF00\")>Movie Database</h1>")
	html_file.puts("<img style=\"padding-left:40%;\" src=#{content_hash["Poster"]}")
	html_file.puts("<br/><br/>")
	html_file.puts("<table style=\"padding-left:25%;padding-right:25%\">")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Title:</td><td>#{content_hash["Title"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Released:</td><td>#{content_hash["Released"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Genre:</td><td>#{content_hash["Genre"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Runtime:</td><td>#{content_hash["Runtime"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Language:</td><td>#{content_hash["Language"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Writer:</td><td>#{content_hash["Writer"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Actors:</td><td>#{content_hash["Actors"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("</tr>")
	html_file.puts("<td><h2>Plot:<h2></td><td style=\"word-wrap:break-word\">#{content_hash["Plot"]}</td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Awards:</td><td>#{content_hash["Awards"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>IMDB Rating & votes:<h2></td><td>#{content_hash["imdbRating"]} , #{content_hash["imdbVotes"]}</td>")
	html_file.puts("</tr>")
	html_file.puts("<tr>")
	html_file.puts("<td><h2>Metascore:</td><td>#{content_hash["Metascore"]}</h2></td>")
	html_file.puts("</tr>")
	html_file.puts("</table>")
	html_file.puts("</body>")
	html_file.puts("</html>")

	html_file.close
end


movie_name=input()
generate_page(movie_name)	




