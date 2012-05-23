class Grep
	attr_accessor :pattern, :file_name
	def initialize(file_name, pattern) 
		@file_name = file_name
		@pattern = pattern
	end

	def search() 
		raise IOError, "File #{file_name} does not exist" unless File.file?(file_name)
		results = []
		grepped_file = nil
		begin
			grepped_file = File.new(file_name)
			grepped_file.each { |line| results << line.chomp if /#{pattern}/ =~ line }			
		ensure
			grepped_file.close unless grepped_file == nil
		end
		return results
	end
	
end 