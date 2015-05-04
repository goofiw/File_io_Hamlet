DIRNAME = "data-hold"

hash = Dir.glob("/vagrant/work/**/*").inject({}) do |hsh, fname|
	ext = File.basename(fname).split('.')[-1].to_s.downcase
	hsh[ext] ||= [0,0]
	hsh[ext][0] += 1
	hsh[ext][1] += File.size(fname)
	hsh
end
file = open("file_size_spreadsheet.txt", "w") do |file|
	hash.each do |arr|
		txt = arr.flatten.join("\t")
		file.puts txt
		puts txt
	end
end