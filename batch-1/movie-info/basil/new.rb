require 'open-uri'
require 'json'




	puts"Enter the Movie title:"
	movie_name=gets.chomp
	movie_name=movie_name.split(" ").join("+")



	movie_url= "http://www.omdbapi.com/?t=#{movie_name}&y=&plot=short&r=json"
	content = open(movie_url).read
	content_hash=JSON.parse(content)
	html_file=File.new("movie_details.html","w")
	movie_details=File.read("template.html")
n=Array['{{Poster}}','{{Title}}','{{Released}}','{{Genre}}}','{{Plot}}']
p=Array['"Title"','"Released"','"Genre"','"Plot"']

for i in 1..4
movie_details=movie_details.gsub("#{n[0]}",content_hash["#{p[0]}"])
html_file.puts(movie_details)
end
