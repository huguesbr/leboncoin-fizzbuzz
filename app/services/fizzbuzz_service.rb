class FizzbuzzService
  class AllPositiveIntegerRequiredError < StandardError; end

  attr_accessor :int1, :int2, :str1, :str2

  def initialize(int1:, int2:, str1:, str2:)
    self.int1 = int1
    self.int2 = int2
    self.str1 = str1
    self.str2 = str2
  end

  def map(i)
    raise AllPositiveIntegerRequiredError unless i.positive? && int1.positive? && int2.positive?

    case
    when (i % (int1 * int2)) == 0
      "#{str1}#{str2}"
    when (i % int2) == 0
      str2
    when (i % int1) == 0
      str1
    else
      i
    end
  end
end