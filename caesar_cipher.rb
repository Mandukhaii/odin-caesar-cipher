def caesar_cipher(string, shift)
  uppercase_alphabet = ('A'..'Z').to_a
  lowercase_alphabet = ('a'..'z').to_a
  result = ''
  string.chars.map do |char|
    if uppercase_alphabet.include?(char)
      new_index = (uppercase_alphabet.index(char) + shift) % 26
      result << uppercase_alphabet[new_index]
    elsif lowercase_alphabet.include?(char)
      new_index = (lowercase_alphabet.index(char) + shift) % 26
      result << lowercase_alphabet[new_index]
    else
      result << char
    end
  end
  result
end

# Check if script is being run directly
if __FILE__ == $PROGRAM_NAME
  string = ARGV[0] # the text to be encrypted
  shift = ARGV[1].to_i # the shift amount
  puts caesar_cipher(string, shift)
end
