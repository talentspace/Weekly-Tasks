require 'json'
require 'open-uri'
puts"Hello,Enter the movie name:\n"
usr_input=gets.chomp
usr_input=usr_input.split(" ")# Check whether the entered movie is more than one word
usr_input=usr_input.join("+")#If yes,add + in between the words.
movie_url= "http://www.omdbapi.com/?t=#{usr_input}&y=&plot=short&r=json"
content = open(movie_url).read
content_hash=JSON.parse(content)
if content_hash["Response"]=="False"
	puts 'Please enter a valid movie name.'
	exit(0)
end
html_file=File.new("movie_detail.html","w")
template_add_data=File.read("template.html")
template_read=template_add_data.split("\n")
data=[content_hash["Title"],content_hash["Poster"],content_hash["Genre"],content_hash["Actors"],content_hash["Plot"],content_hash["imdbRating"]]
repace_list=["{{Title}}","{{Poster}}","{{Genre}}","{{Actors}}","{{Plot}}","{{imdbRating}}"]
template_read.each do |i|
	repace_list.each_index do |j|
		if i.include? repace_list[j]

			template_add_data=template_add_data.gsub(repace_list[j],data[j])
		end
	end		
end
html_file.puts(template_add_data)	
html_file.close



