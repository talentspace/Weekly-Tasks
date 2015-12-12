require 'open-uri'
require 'json'

class MovieDataGenerator
   
   def initialize(movie_name)
     @movie_tilte = "http://www.omdbapi.com/?t=#{movie_name}&y=&plot=short&r=json"
   end
     
   def read_movie
     api_data=open(@movie_tilte).read
     m_info=JSON.parse(api_data)
     temp_html=File.read('template.html')
     temp_html.gsub!('{{Poster}}',m_info['Poster'])
     temp_html.gsub!('{{Title}}',m_info['Title'])
     temp_html.gsub!('{{Plot}}',m_info['Plot'])
     temp_html.gsub!('{{Director}}',m_info['Director'])
     temp_html.gsub!('{{Year}}',m_info['Year'])
     
     write_html(temp_html)
   end
  
   def write_html(template)
     File.write("Lucy.html",template)
   end

end

MovieDataGenerator.new('Lucy').read_movie

