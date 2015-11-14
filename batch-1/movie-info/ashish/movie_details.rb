require 'json'
require 'open-uri'

#Get the movie name from the user
puts"Hello,Enter the movie name:"

#code to get the data and convert it into hash
usr_input    = gets.chomp
usr_input    = usr_input.split(" ")
usr_input    = usr_input.join("+")
movie_url    = "http://www.omdbapi.com/?t=#{usr_input}&y=&plot=short&r=json"
content      = open(movie_url).read
content_hash = JSON.parse(content)

#Check whether the entered movie name is valid
if content_hash["Response"]=="False"
	puts 'Please enter a valid movie name.'
	exit(0)
end

#Code for creating the html page from the input
html_file         = File.new("movie_detail.html","w")
template_add_data = File.read("template.html")
template_read     = template_add_data.split("\n")
data              = [content_hash["Title"],content_hash["Poster"],content_hash["Genre"],content_hash["Actors"],content_hash["Plot"],content_hash["imdbRating"]]
repace_list       = ["{{Title}}","{{Poster}}","{{Genre}}","{{Actors}}","{{Plot}}","{{imdbRating}}"]

template_read.each_with_index do |template_line,index_1|
	repace_list.each_with_index do |replace_element,index_2|
		if template_line.include? replace_element
			template_add_data=template_add_data.gsub(replace_element,data[index_2])		
		end
	end		
end
html_file.puts(template_add_data)
html_file.close



