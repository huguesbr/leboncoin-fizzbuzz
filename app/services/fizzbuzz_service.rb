class FizzbuzzService
  class AllPositiveIntegerRequiredError < StandardError; end

  attr_accessor :int1, :int2, :str1, :str2

  def initialize(int1:, int2:, str1:, str2:)
    raise AllPositiveIntegerRequiredError unless int1.positive? && int2.positive?

    self.int1 = int1
    self.int2 = int2
    self.str1 = str1
    self.str2 = str2
  end

  # @return [Int, String] either the integer or the corresponding fizzbuzz value
  def map(i)
    raise AllPositiveIntegerRequiredError unless i.positive?

    if (i % (int1 * int2)) == 0
      "#{str1}#{str2}"
    elsif (i % int2) == 0
      str2
    elsif (i % int1) == 0
      str1
    else
      i
    end
  end
end
