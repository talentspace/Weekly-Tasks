
require 'open-uri'
require 'json'



def input
	puts"Enter the Movie title:"
	movie_name=gets.chomp
	movie_name=movie_name.split(" ").join("+")
	return movie_name
end

def generate_page movie_name
	movie_url= "http://www.omdbapi.com/?t=#{movie_name}&y=&plot=short&r=json"
	content = open(movie_url).read
	content_hash=JSON.parse(content)
	html_file=File.new("movie_details.html","w")
	movie_details=File.read("template.html")
	movie_details=movie_details.gsub("{{Poster}}",content_hash["Poster"])
	movie_details=movie_details.gsub("{{Title}}",content_hash["Title"])
	movie_details=movie_details.gsub("{{Released}}",content_hash["Released"])
	movie_details=movie_details.gsub("{{Genre}}",content_hash["Genre"])
	movie_details=movie_details.gsub("{{Runtime}}",content_hash["Runtime"])
	movie_details=movie_details.gsub("{{Language}}",content_hash["Language"])
	movie_details=movie_details.gsub("{{Writer}}",content_hash["Writer"])
	movie_details=movie_details.gsub("{{Actors}}",content_hash["Actors"])
	movie_details=movie_details.gsub("{{Plot}}",content_hash["Plot"])
	movie_details=movie_details.gsub("{{Awards}}",content_hash["Awards"])
	movie_details=movie_details.gsub("{{imdbRating}}",content_hash["imdbRating"])
	movie_details=movie_details.gsub("{{imdbVotes}}",content_hash["imdbVotes"])
	movie_details=movie_details.gsub("{{Metascore}}",content_hash["Metascore"])
	html_file.puts(movie_details)
	puts "Html page has been generated in "+Dir.getwd+" as movie_details.html"
end

movie_name=input()
generate_page(movie_name)
