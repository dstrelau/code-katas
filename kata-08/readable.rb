$: << File.expand_path('lib', File.dirname(__FILE__))
require 'dictionary'
require 'string_ext'
require 'benchmark'

dict = Dictionary.new(ARGV.shift)
words = []

time = Benchmark.measure do
  dict.words_of_length(6).each do |word|
    [[2,4],[3,3],[4,2]].each do |first,last|
      if dict.include?(word.firstc(first)) && dict.include?(word.lastc(last))
        words << word
      end
    end
  end
end

puts "#{words.length} words in #{"%.2f" % time.total} seconds"
