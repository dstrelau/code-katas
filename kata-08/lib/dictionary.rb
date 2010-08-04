require 'bsearch'

class Dictionary
  def initialize(wordlist=nil)
    @wordlist = wordlist || "/usr/share/dict/words"
  end

  def words
    @_words ||= File.readlines(@wordlist).map(&:chomp)
  end

  def sorted_words
    @_sorted_words ||= words.sort
  end

  def include?(word)
    words.include?(word)
  end

  def binclude?(word)
    sorted_words.bsearch {|w| w <=> word }
  end

  def words_of_length(length)
    words.select {|w| w.length == length }
  end
end
