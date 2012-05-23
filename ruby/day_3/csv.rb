module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end
	
	module ClassMethods
		def acts_as_csv
			include InstanceMethods
			include Enumerable
		end
	end
	
	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')
			
			file.each do |row|
				@csv_contents << CsvRow.new(self, row.chomp.split(', '))
			end
		end
		
		attr_accessor :headers, :csv_contents
		
		def initialize
			read
		end
		
		def each 
			@csv_contents.each do |content|
				yield content
			end
		end
	end	
end

class CsvRow
	
	attr_accessor :row_content, :csv
	def initialize(csv, row_content) 
		@csv = csv
		@row_content = row_content		
	end
	
	def method_missing(name, *args) 
		index = csv.headers.index(name.to_s)
		return nil unless index
		return row_content[index]
	end

end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end