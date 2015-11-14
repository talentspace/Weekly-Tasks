require 'open-uri'
require 'json'

def input()
	puts"Enter the Movie title:"
	movie_name=gets.chomp
	movie_name=movie_name.split(" ").join("+")
end

def generate_page (movie_name)
	movie_url= "http://www.omdbapi.com/?t=#{movie_name}&y=&plot=short&r=json"
	content = open(movie_url).read
	content_hash=JSON.parse(content)
	html_file=File.new("movie_details.html","w")
	movie_details=File.read("template.html")
	n=Array['{{Poster}}','{{Title}}','{{Released}}','{{Genre}}','{{Runtime}}','{{Language}}','{{Writer}}','{{Actors}}','{{Plot}}','{{Awards}}','{{imdbRating}}','{{imdbVotes}}','{{Metascore}}']
	p=Array['Poster','Title','Released','Genre','Runtime','Language','Writer','Actors','Plot','Awards','imdbRating','imdbVotes','Metascore']
	for i in 0..12
 	movie_details=movie_details.gsub(n[i],content_hash[p[i]])
	end
	html_file.puts(movie_details)
	puts "Html page has been generated in "+Dir.getwd+" as movie_details.html"
end

movie_name=input()
generate_page(movie_name)
