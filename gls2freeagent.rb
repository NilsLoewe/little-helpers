#!/usr/bin/ruby -w

content = []
filename = ARGV.pop

file = File.new(filename, "r")
while (line = file.gets)
     content << "#{line}"
end
file.close

content = content.drop(1)

out = []

content.each do |c|
	lines = c.split(';')
	date = lines[1].gsub('.','/')
	position = lines[19].gsub('.','').gsub(',','.')
	text = lines[3] + lines[5]
	text = text.gsub(',',' ')
	newline = date + ',' + position + ',' + text
	out << newline
end

file = File.new("out_"+filename, "w")
file.puts(out)
file.close
