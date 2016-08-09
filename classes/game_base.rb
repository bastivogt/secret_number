module SecretNumber
  class GameBase
    def initialize(min, max)
      @input = 0
      @count = 0
      @abort = false

      init min, max

    end

    def init(min, max)
      @min = min
      @max = max

      @g = Generator.new @min, @max
      @secret_num = @g.secret_num
    end



    def start
      Lang.prepare min: @min, max: @max, count: @count, secret_num: @secret_num
      puts Lang.text[:start]
      while true
        @count += 1
        Lang.prepare min: @min, max: @max, count: @count, secret_num: @secret_num
        @input = gets.chomp
        @abort = if @input == "q" then
                   @abort = true
                 end

        @input = @input.to_i



        if @g.to_low?(@input) && @g.in_range?(@input)
          puts Lang.text[:to_low]
        end

        if @g.to_height?(@input) && @g.in_range?(@input)
          puts Lang.text[:to_height]
        end

        if @g.out_of_range?(@input) && !@abort
          puts Lang.text[:out_of_range]
        end

        if @g.matched? @input
          puts Lang.text[:matched]
          break
        end

        if @abort
          puts Lang.text[:aborted]
          break
        end

      end
    end
  end
end