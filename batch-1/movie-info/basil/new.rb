require 'open-uri'
require 'json'

puts"Enter the Movie title:"
movie_name=gets.chomp.split(" ").join("+")
url= "http://www.omdbapi.com/?t=#{movie_name}&y=&plot=short&r=json"
content = open(url).read
content_hash=JSON.parse(content)
html_file=File.new("movie.html","w")
movie_details=File.read("index.html")
n=Array['{{Poster}}','{{Title}}','{{Released}}','{{Genre}}','{{Plot}}']
p=Array['Poster','Title','Released','Genre','Plot']
for i in 0..4
 movie_details=movie_details.gsub(n[i],content_hash[p[i]])
end
html_file.puts(movie_details)
