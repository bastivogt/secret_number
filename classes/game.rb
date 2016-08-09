module SecretNumber
  class Game

    def initialize
      @min = 0
      @max = 10
      @level_count = 0
      @level = @level_count + 1
      @gb = nil
      @success = true
      @levels = [10, 100]

    end

    def start
      while true
        set_level
      end
    end

    def set_level

      Lang.prepare level: @level
      puts "" if @level != 1
      puts Lang.text[:level]
      @gb = GameBase.new 1, @levels[@level_count]
      @success = @gb.start
      Lang.prepare secret_num: @gb.secret_num

      if @success
        if @level_count < @levels.count() -1
          @level_count += 1
          @level = @level_count +1
        else
          # puts Lang.text[:exit]
          exit
        end
      end

    end



  end
end