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
      result_array = aggregate_numbers(simplified_array)

      find_largest_number(result_array)
    end

    private

    def find_largest_number(array)
      largest_number = array[0]

      array[1..-1].each do |number|
        largest_number = number if number > largest_number
      end

      largest_number
    end

    # Recursive function
    def aggregate_numbers(array)
      # Skip negative numbers
      # start_index = -1
      # simpler_array.each_with_index do |number, index|
      #   if number > 0
      #     start_index = index
      #     break
      #   end
      # end

      # All numbers are negative
      # Find the largest single number
      # return simpler_array[0] if start_index == -1

      aggregate_array = Array.new
      index = 0
      loop do
        break if index >= array.size

        if array[index] <= 0
          aggregate_array << array[index]

          index += 1
          next
        end

        sum = array[index]

        # Look ahead until find a positive sum
        future_sum = 0
        for end_index in (index+1)..(array.size-1) do
          future_sum += array[end_index]

          if future_sum > 0
            sum += future_sum
            index = end_index

            break
          end
        end

        aggregate_array << sum

        index += 1
      end

      array == aggregate_array ? array : aggregate_numbers(aggregate_array)
    end

    def simplified_array
      simpler_array = Array.new
      is_positive_number = numbers[0] >= 0

      cumulative_sum = 0
      # simpler_array << numbers[0]
      numbers[0..-1].each do |number|
        if is_positive_number == number >= 0
          cumulative_sum += number
        else
          simpler_array << cumulative_sum

          cumulative_sum = number
          is_positive_number = number >= 0
        end
      end
      simpler_array << cumulative_sum

      simpler_array
    end
  end
end
