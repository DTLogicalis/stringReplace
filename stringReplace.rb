#!/usr/bin/ruby

#Created by Daniel Tennant 01/08/2013
#Loops through a directory of files and replaces instances of strings with defined text

class StringReplace

	def initialize fileOpen
		@fileIn = fileOpen
		@fileOut = '../Convert/' + fileOpen
		readFile
	end

	def readFile
		puts "Reading File.."
		findReplace File.read(@fileIn)
	end

	def findReplace content
		puts "Replacing Content.."
		writeFile content.gsub(/hello world/,'Replace with me')
	end

	def writeFile replace
		puts "Writing File"
		File.open(@fileOut, 'w'){|file| file.puts replace}
	end

end
	
def help
	print "You must pass the path of a file to process

	Usage: #{__FILE__} target_file"
end

if ARGV.empty?
	help
	exit
else
	target = ARGV.join ' '
	Dir.foreach(target) do |item|
		next if item == "." or item == ".." or item == ".DS_Store"
		item = target + "/" + item
		puts item
		f = StringReplace.new item
	end
end

#fileOpen = 'test.txt'
#fileWrite = 'testNew.txt'
#contents = File.read(fileOpen)
#replace = contents.gsub(/hello world/, 'Replace with hey there')
#File.open(fileWrite, 'w') {|file| file.puts replace}