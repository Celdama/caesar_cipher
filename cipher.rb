# rubocop-disabled
require 'pry'

module UpperString
  def is_upper? letter
    letter == letter.upcase
  end 
end 

class Word 
  $alphabet_array = [*"a".."z"]

  def display_alphabet
    $alphabet_array
  end

  def shift_letter letter, shift, up = nil
    current_index = $alphabet_array.index(letter.downcase)

    if current_index + shift > 26
      shifted_index = shift - ( 26 - current_index )
      word = $alphabet_array[shifted_index]
      up ? word.upcase : word
    else 
      word = $alphabet_array[current_index + shift]
      up ? word.upcase : word
    end 
  end 
end 

class CaesarCipher < Word
  include UpperString

  def display
    p display_alphabet
  end

  def translate(string, shift_by)
    shifted_string = []
    array = string.chars
    translated_string = ""
    array.each do |unshift_letter|
      ascii = unshift_letter.ord

      if ascii.between?(65, 90) || ascii.between?(97, 122)
        up =  is_upper? unshift_letter
        letter = shift_letter(unshift_letter, shift_by, up)
        translated_string << letter
      else 
        translated_string << unshift_letter
      end
    end
    p translated_string
  end
end

code = CaesarCipher.new


code.translate "HeLlO World!", 5

