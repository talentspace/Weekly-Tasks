require 'open-uri'
require 'json'

def input()
	puts"Enter the Movie title:"
	movie_name=gets.chomp
	movie_name=movie_name.split(" ").join("+")
end

def generate_page (movie_name)
	movie_url= "http://www.omdbapi.com/?t=#{movie_name}&y=&plot=short&r=json"
	trailer_url= "http://trailersapi.com/trailers.json?movie=#{movie_name}&limit=1&width=320"
	content = open(movie_url).read
	trailer = open(trailer_url).read
	content_hash=JSON.parse(content)
	trailer_hash=JSON.parse(trailer)
	html_file=File.new("movie_details.html","w")
	movie_details=File.read("template.html")
	n=Array['{{Poster}}','{{Title}}','{{Released}}','{{Genre}}','{{Runtime}}','{{Language}}','{{Writer}}','{{Actors}}','{{Plot}}','{{Awards}}','{{imdbRating}}','{{imdbVotes}}','{{Metascore}}']
	p=Array['Poster','Title','Released','Genre','Runtime','Language','Writer','Actors','Plot','Awards','imdbRating','imdbVotes','Metascore']
	for i in 0..12
 		movie_details=movie_details.gsub(n[i],content_hash[p[i]])
	end
	if(trailer_hash!=[])
		movie_details=movie_details.gsub("{{Trailer}}",trailer_hash[0]["code"])
	else
		movie_details=movie_details.gsub("{{Trailer}}","Trailer not found")
	end
	html_file.puts(movie_details)
	puts "Html page has been generated in "+Dir.getwd+" as movie_details.html"
end

movie_name=input()
generate_page(movie_name)
