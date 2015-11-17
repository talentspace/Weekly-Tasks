require 'open-uri'
require 'json'

puts"Pleaes, Enter a movie name:"
film_name = gets.chomp
film_name = film_name.split(" ").join("+")

movie_url= "http://www.omdbapi.com/?t=#{film_name}&y=&plot=short&r=json"
content = open(movie_url).read
web_content = JSON.parse(content)
html_file = File.new("#{web_content["Title"]}.html","w")
movie_details = File.read("template.html")

changing_list = Array['{{Poster}}','{{Title}}','{{Genre}}','{{Actors}}','{{Plot}}','{{imdbRating}}']
replacing_list = Array['Poster','Title','Genre','Actors','Plot','imdbRating',]

for i in 0..5
movie_details = movie_details.gsub(changing_list[i],web_content[replacing_list[i]])
end

html_file.puts(movie_details)


