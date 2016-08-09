module SecretNumber
  class Generator
    attr_reader :secret_num

    def initialize(min, max)
      set_range min, max
      generate_secret_num
    end

    def set_range(min, max)
      @min = min
      @max = max
    end

    def generate_secret_num
      @secret_num = rand(@min...@max)
    end

    def in_range?(num)
      return (num >= @min) && (num <= @max)
    end

    def out_of_range?(num)
      return !in_range?(num)
    end

    def to_low?(num)
      return num < @secret_num
    end

    def to_height?(num)
      return num > @secret_num
    end

    def matched?(num)
      return num == @secret_num
    end
  end
end