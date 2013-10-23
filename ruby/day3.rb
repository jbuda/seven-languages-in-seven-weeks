module ActsAsCsv

  class CsvRow
    
    attr_accessor :header, :content

    def initialize header,content
      @header = header
      @content = content
    end
    
    def method_missing name, *args
      @content[@header.find_index(name.to_s)]
    end

  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase+'.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(',')
      
      file.each do |row|
        @csv_contents << CsvRow.new(@headers,row.chomp.split(','))
      end
    end
    
    def each 
      @csv_contents.each do |row|
        yield row
      end
    end

    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts "#{row.name} is #{row.age} years old" }
