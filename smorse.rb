Dir["./smorse/*.rb"].each {|file| require file }

module Smorse
  class Client

    module Types
      ENCODE = 'Encode'
      DECODE = 'Decode'
    end

    Types.constants.each do |const|
      type = eval("Types::#{const}")
      eval("include Smorse::#{type}")
    end

    attr_reader :message

    def initialize(text, type = Types::ENCODE)
      @message = text
      @type    = type.downcase
    end

    def run
      self.public_send("#{@type}_message")
    end

  end
end
