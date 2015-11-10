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
	layout=File.read('Page_layout.txt')
	layout=layout.split("`")
	layout.each do |n|
		html_file.puts(n)
	end
end


movie_name=input()
generate_page(movie_name)	
