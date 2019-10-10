module Smorse
  module Encode

    ALPHABET_TO_MORSE = {
      "a"=>".-",
      "b"=>"-...",
      "c"=>"-.-.",
      "d"=>"-..",
      "e"=>".",
      "f"=>"..-.",
      "g"=>"--.",
      "h"=>"....",
      "i"=>"..",
      "j"=>".---",
      "k"=>"-.-",
      "l"=>".-..",
      "m"=>"--",
      "n"=>"-.",
      "o"=>"---",
      "p"=>".--.",
      "q"=>"--.-",
      "r"=>".-.",
      "s"=>"...",
      "t"=>"-",
      "u"=>"..-",
      "v"=>"...-",
      "w"=>".--",
      "x"=>"-..-",
      "y"=>"-.--",
      "z"=>"--.."
    }

    def self.included(base)
      base.extend(ClassMethods)
    end

    def encode_message
      smooshed_message = message.gsub(' ','')
      chars            = smooshed_message.split('')
      mapping          = chars.map{|c| ALPHABET_TO_MORSE[c] }

      return mapping.join
    end

    module ClassMethods
      def encode(text)
        encoder = self.new(text, __method__.to_s)
        encoder.run
      end
    end

  end
end
