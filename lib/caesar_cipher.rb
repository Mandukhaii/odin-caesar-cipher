class CaesarCipher
  def initialize(shift)
    @shift = shift
    @uppercase_alphabet = ('A'..'Z').to_a
    @lowercase_alphabet = ('a'..'z').to_a
  end

  def encrypt(string)
    result = ''
    string.chars.map do |char|
      if @uppercase_alphabet.include?(char)
        new_index = (@uppercase_alphabet.index(char) + @shift) % 26
        result << @uppercase_alphabet[new_index]
      elsif @lowercase_alphabet.include?(char)
        new_index = (@lowercase_alphabet.index(char) + @shift) % 26
        result << @lowercase_alphabet[new_index]
      else
        result << char
      end
    end
    result
  end

  def self.encrypt(string,shift)
    new(shift).encrypt(string)
  end
end

if __FILE__ == $PROGRAM_NAME
  
  if ARGV[0] !~ /^[a-zA-Z\s]+$/ || ARGV[1] !~ /^-?\d+$/ || ARGV.length != 2
    puts "Usage: ruby lib/caesar_cipher.rb <string_to_encrypt> <shift_number>"
    exit 1
  end

  string = ARGV[0] # the text to be encrypted
  shift = ARGV[1].to_i # the shift amount
  
  puts CaesarCipher.encrypt(string,shift)
end

