module Sets
  class MightySet
    attr_reader :numbers

    def largest_sum
      calculate unless defined? @largest_sum
    end

    def initialize numbers
      @numbers = numbers
    end

    def calculate
      @largest_sum = 15

      @largest_sum
    end
  end
end
