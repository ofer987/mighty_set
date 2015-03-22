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
      simplified_array = simplify_array(numbers)
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

        # if array[index] <= 0
        #   aggregate_array << array[index]
        #
        #   index += 1
        #   next
        # end

        # sum = array[index]

        if array[index] < 0 && (index + 1) < array.size && array[index] + array[index + 1] >= 0
          number = array[index] + array[index + 1]
          index += 2
        else
          number = array[index]
          index += 1
        end

        aggregate_array << number

        # Look ahead until find a positive sum
        # negative_sum = 0
        # if
        # for end_index in (index+1)..(array.size-1) do
        #   # future_sum += array[end_index]
        #
        #   if array[end_index] > 0
        #     if (sum + negative_sum) > 0
        #       sum += negative_sum
        #     end
        #     index = end_index-1
        #
        #     break
        #   end
        #
        #   negative_sum += array[end_index]
        #
        #   # if future_sum > 0
        #   #   sum += future_sum
        #   #   index = end_index
        #   #
        #   #   break
        #   # end
        # end

        # aggregate_array << sum

        # index += 1
      end

      aggregate_array = simplify_array(aggregate_array)
      array == aggregate_array ? array : aggregate_numbers(aggregate_array)
    end

    # Discard 0
    # Sum all contiguous positive numbers
    # Sum all contiguous negative numbers
    def simplify_array(array)
      simpler_array = Array.new
      is_positive_number = array[0] > 0
      previous_number_was_zero = false

      cumulative_sum = 0
      array[0..-1].each do |number|
        if number == 0
          previous_number_was_zero = true
          unless cumulative_sum == 0
            simpler_array << cumulative_sum
            cumulative_sum = 0
          end
          next
        elsif previous_number_was_zero || is_positive_number == number >= 0
          previous_number_was_zero = false
          cumulative_sum += number
          is_positive_number = number >= 0
        else
          previous_number_was_zero = false
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
