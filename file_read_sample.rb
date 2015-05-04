require 'open-uri'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
open("hamlet.txt", "w") { |file| file.write(open(url).read) }

open("hamlet.txt", "r") do |file|
	file.readlines.each_with_index do |line, idx|
		puts line if idx % 42 == 41
	end
end
puts "\n\n\n\n\n\n\n"
hamlet_speaking = false
open("hamlet.txt", "r") do |file|

	file.readlines.each do |line|
		
		if /^\s\sHam/.match(line)
			hamlet_speaking = true
			#puts line
    elsif !!/^\s\s[^H][^a][^m]/.match(line)
    	hamlet_speaking = false
    end
		puts line if hamlet_speaking
	end
end