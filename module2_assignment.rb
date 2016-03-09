#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
    attr_accessor :highest_wf_count,:highest_wf_words,:content,:line_number
  

    def initialize (text,line_number)
      @content = text
      @line_number = line_number
        @highest_wf_words = []
      calculate_word_frequency()
    end
    class << self 
    	
    end
    def calculate_word_frequency ()
        tocount = content.split
        count = Hash.new(0)
        tocount.each {|element| count[element.downcase] += 1}
        count = count.sort_by {|x,y| y}
        count = count.reverse!
        @highest_wf_count = count.first[1]
		count.each do |key,value|
		 if value == highest_wf_count
		 	@highest_wf_words << key
		 end
		end

    end
end

#  Implement a class called Solution. 
class Solution
  attr_accessor :analyzer,:highest_count_across_lines,:highest_count_words_across_lines
    
    def initialize()
      @analyzers = Array.new
    end

    def analyzers
    	@analyzers
    end


    def analyze_file()
      line_number = 1
        File.foreach('test.txt') do |line|  
          @analyzers << LineAnalyzer.new(line,line_number)
          line_number +=  1
        end
    end

    def calculate_line_with_highest_frequency()
    	@highest_count_across_lines = 0
      unless @analyzers.empty?
        @analyzers.each do |element| 
         if element.highest_wf_count > highest_count_across_lines 
          @highest_count_across_lines = element.highest_wf_count
         end
        end 
      end
      @highest_count_words_across_lines = Array.new
      unless @analyzers.empty?
        @analyzers.each do |element|
          if @highest_count_across_lines == element.highest_wf_count
            @highest_count_words_across_lines << element 
          end
        end
      end
    end

    def print_highest_word_frequency_across_lines()
      puts "The following words have the highest word frequency per line:"
      unless highest_count_words_across_lines.empty?
        @highest_count_words_across_lines.each do |element|
        	word= element.highest_wf_words
        	num = element.line_number
        	
         puts "#{word} appears in line #{element.line_number})"
        end
      end
    end
end