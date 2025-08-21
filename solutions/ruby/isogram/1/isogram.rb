=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
module Isogram
  ALLOWED_SYMBOLS = ' -'
  def self.isogram?(word)
    letters = {}
    word.downcase.delete(ALLOWED_SYMBOLS).each_char do |c|
      return false unless letters[c] == letters.default # return false if key wasn't present in hashmap
      letters[c] = 1
    end
    return true
  end
end