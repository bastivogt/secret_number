module SecretNumber
  class Game

    attr_reader :game_time

    def initialize
      @min = 0
      @max = 10
      @level_count = 0
      @level = @level_count + 1
      @gb = nil
      @success = true
      @levels = []
      @start_time = 0
      @end_time = 0
      @game_time = 0;
      @total_count = 0
      create_levels

    end

    def start
      @start_time = Time.now
      while true
        set_level
      end
    end


    def create_levels(count = 10, steps = 10)
      @levels = []
      count.times do |x|
        @levels[x] = steps ** (x + 1)
      end
    end


    def set_level

      Lang.prepare level: @level
      puts "" if @level != 1
      puts Lang.text[:level]
      @gb = GameBase.new 1, @levels[@level_count]
      @success = @gb.start
      @total_count += @gb.count

      Lang.prepare secret_num: @gb.secret_num

      if @success
        if @level_count < @levels.count() -1
          @level_count += 1
          @level = @level_count +1
        else
          @end_time = Time.now
          @game_time = @end_time - @start_time
          Lang.prepare game_time: convert_seconds(@game_time), total_count: @total_count
          puts Lang.text[:exit_success]
          exit
        end
      end

    end


    private
    def convert_seconds(sec)
      Time.at(sec).utc.strftime("%H:%M:%S")
    end





  end
end