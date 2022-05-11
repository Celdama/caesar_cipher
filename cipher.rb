# rubocop-disabled
require 'pry'

class CaesarCipher
  def translate(string, shift)
    shifted = []
    array = string.chars

    array.each do |letter|
      ascii = letter.ord

      if ascii.between?(65, 90) 
        ascii + shift > 90 ? shifted << 65 + (ascii + shift - 91) : shifted << ascii + shift
      elsif  letter.ord.between?(97, 122)
        ascii + shift > 122 ? shifted << 97 + (ascii + shift - 123) : shifted << ascii + shift
      else 
        shifted << ascii
      end
    end
    translated_string = ""
    shifted.each { | l | translated_string << l.chr}
    p translated_string
  end
end

code = CaesarCipher.new

code.translate('AaBbCc - DdEeFf', 10)
code.translate('What a string!', 5)
code.translate('', 5)
