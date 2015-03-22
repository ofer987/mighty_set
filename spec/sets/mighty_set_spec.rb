# require_relative '../spec_helper.rb'
require_relative '../../lib/sets.rb'

include Sets

# def assert_set actual_numbers, expected_largest_sum
#   context actual_numbers.to_s do
#     let(:numbers) do
#       actual_numbers
#     end
#
#     it "is #{expected_largest_sum.to_s}" do
#       expect(actual_largest_sum).to eq(expected_largest_sum)
#     end
#   end
# end

RSpec.describe MightySet do
  # let(:actual_largest_sum) do
  #   set = MightySet.new(numbers)
  #
  #   set.largest_sum
  # end

  let(:sets) do
    [
      [ [0, 1, 2, 3, 4, 5], 15 ],
      [ [-1, 0, 1, 2, 3, 4, 5], 15 ],
      [ [-1, 0, 1, 2, 3, 4, -1], 10 ],
      [ [-1, -10, 0, 1, 2, 3, 4, -1, -20], 10 ],
      [ [-1, -10, 0, 1, 2, 3, 4, -1, -20, 100], 100 ],
      [ [-1, -10, 0, 1, 2, 3, 4, -1, -20, 100, 120], 220 ],
      [ [-1, -10, 0, 1, 1000, 3, 4, -1, -20, 100, 120], 1207 ],
      [ [-1, -10, 0, 1, 1000, 3, 4, -1, -20, 100, 120, -2000, 2], 1207 ],
      [ [3000, -1, -10, 0, 1, 1000, 3, 4, -1, -20, 100, 120, -2000, 2], 4196 ]
    ]
  end

  context 'assert the set' do
    it 'succeeds' do
      sets.each do |set|
        numbers = set[0]
        expected_sum = set[1]
        expect((MightySet.new numbers).largest_sum).to eq(expected_sum)
      end
    end
  end
end
