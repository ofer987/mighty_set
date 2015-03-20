# require_relative '../spec_helper.rb'
require_relative '../../lib/sets/mighty_set.rb'

include Sets

RSpec.describe MightySet do
  let(:actual_largest_sum) do
    set = MightySet.new(numbers)

    set.largest_sum
  end

  context "[0, 1, 2, 3, 4, 5]" do
    let(:numbers) do
      [0, 1, 2, 3, 4, 5]
    end

    let(:expected_largest_sum) do
      15
    end

    it "is 15" do
      expect(actual_largest_sum).to eq(expected_largest_sum)
    end
  end
end
