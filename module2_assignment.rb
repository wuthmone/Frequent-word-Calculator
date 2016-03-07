#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  

    attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number
    @highest_wf_words = []

    def initialize (text_line,line_no)
      @content = text_line 
      @line_number = line_no
      calculate_word_frequency()
    end
    def self. calculate_word_frequency ()
        @content = content.chomp.split
        count = Hash.new(0)
        content.each {|content| count[content.downcase] += 1}
        count = count.sort_by {|x,y| y}
        count = count.reverse!
        highest = count[0].to_a
        @highest_wf_count = highest[1]
        @highest_wf_words << highest[0]
        
    end
end

#  Implement a class called Solution. 
class Solution
  attr_accessor :analyzer,:highest_count_across_lines,:highest_count_words_across_lines
    @highest_count_words_across_lines = []

    
    def initialize()
      @analyzer = []
    end

    def analyze_file()
      
      line_num = 1
      
      begin

        File.foreach('test.txt') do |line|  
          @analyzer << LineAnalyzer.new(line,line_num)
          line_num +=  1
        end

        rescue Exception => e
          puts e.message
          puts "File do not exit"
        end

      end
     
    end

    def calculate_line_with_higest_frequency()
      @highest_count_across_lines = 0
      unless analyzer.empty?
        analyzer.each do |element| 
         if element.highest_wf_count > highest_count_across_lines
          @highest_count_across_lines = element.highest_wf_count
         end
        end 
      end

      unless analyzer.empty?
        analyzer.each do |element|
          if @highest_count_words_across_lines == element.highest_wf_count
            @highest_count_words_across_lines << element
          end
        end
      end
    end

    def print_hightest_word_frequency_across_lines()
      puts "The following words have the highest word frequency per line:"
      unless print_hightest_word_frequency_across_lines.empty?
        highest_count_words_across_lines.each do |element|
          puts "#{[element.highest_wf_words]}(appears in line #{element.line_number})"
          
        end
      
    end
end

