module Smorse
  module Decode

    MORSE_TO_ALPHABET = {
      ".-"=>"a",
      "-..."=>"b",
      "-.-."=>"c",
      "-.."=>"d",
      "."=>"e",
      "..-."=>"f",
      "--."=>"g",
      "...."=>"h",
      ".."=>"i",
      ".---"=>"j",
      "-.-"=>"k",
      ".-.."=>"l",
      "--"=>"m",
      "-."=>"n",
      "---"=>"o",
      ".--."=>"p",
      "--.-"=>"q",
      ".-."=>"r",
      "..."=>"s",
      "-"=>"t",
      "..-"=>"u",
      "...-"=>"v",
      ".--"=>"w",
      "-..-"=>"x",
      "-.--"=>"y",
      "--.."=>"z"
    }

    def self.included(base)
      base.extend(ClassMethods)
    end

    def decode_message
      max_message_length = message.length
      possible_chars = Hash.new{|k,v| k[v] = [] }

      MORSE_TO_ALPHABET.each do |k,v|
        possible_chars[v] = (0 ... max_message_length).find_all{ |n| message[n,k.length] == k }
      end

      probable_words = Hash.new{|k,v| k[v] = Array.new(max_message_length) }

      puts possible_chars

      # # possible_chars.each do |char, indexes|
      # #   message_length.times do |n|
      # #     indexes.each do |idx|
      # #       probable_words[n][idx] = char
      # #     end
      # #   end
      # # end
      # max_message_length.times do |n|
      #   possible_chars.each do |char, indexes|
      #     if indexes.include?(n)
      #       probable_words[n][n] = char
      #     end
      #   end
      # end
      #
      probable_words
    end

    module ClassMethods
      def decode(text)
        decoder = self.new(text, __method__.to_s)
        decoder.run
      end
    end

  end
end
