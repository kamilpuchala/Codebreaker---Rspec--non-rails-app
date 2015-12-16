module Codebreaker
  class Game

    def initialize(outputt)
      @outputt = outputt
    end
    
    def start(secret)
      @secret = secret
      @outputt.puts 'Welcome to Codebreaker!'
      @outputt.puts 'Enter guess:'
    end

    def guess(guess) 
      marker = Marker.new(@secret, guess)
      @outputt.puts '+'*marker.exact_match_count + '-'*marker.number_match_count
    end
  end
end
