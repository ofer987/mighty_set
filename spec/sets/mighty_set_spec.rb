# require_relative '../spec_helper.rb'
require_relative '../../lib/sets.rb'

include Sets

def assert_set actual_numbers, expected_largest_sum
  context actual_numbers.to_s do
    let(:numbers) do
      actual_numbers
    end

    it "is #{expected_largest_sum.to_s}" do
      expect(actual_largest_sum).to eq(expected_largest_sum)
    end
  end
end

RSpec.describe MightySet do
  let(:actual_largest_sum) do
    set = MightySet.new(numbers)

    set.largest_sum
  end

  assert_set [0, 1, 2, 3, 4, 5], 15
  assert_set [-1, 0, 1, 2, 3, 4, 5], 15
  assert_set [-1, 0, 1, 2, 3, 4, -1], 10
end

