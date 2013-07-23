class Reader
	def read()
		read = STDIN.read
		
		tests = read.split("\n\n")
		assert = tests.shift
		
		tests.each {|test|
			parts = test.split("|")
			assert = parts[1]
			title = assert.match /"([^"]+)"/ #"
			assertParts = assert.gsub(title[0], '').split(' ')
			
			puts '##'+title[1]+"\n\nRequests:\n\n"
			
			curl = parts[0].strip
			puts "```sh\n"+curl+"\n```\n\nResponses:\n\n"
			puts "```ruby\n"+assertParts[1].strip+"\n```\n\n"
		}
	end
end
Reader.new.read()	