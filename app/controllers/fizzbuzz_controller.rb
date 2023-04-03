class FizzbuzzController < ApplicationController
  include CollectStatistic

  def show
    results = (1..params[:limit].to_i).map { |i| service.map(i) }
    render json: results
  end

  private

  def service
    @service ||= FizzbuzzService.new(**fizzbuzz_config_params)
  end

  def fizzbuzz_config_params
    fizzbuzz_config_params = params.permit(:int1, :int2, :str1, :str2).to_h.deep_symbolize_keys
    [:int1, :int2].each { |k| fizzbuzz_config_params[k] = fizzbuzz_config_params[k].to_i }
    fizzbuzz_config_params
  end
end

__END__

The original fizz-buzz consists in writing all numbers from 1 to 100, and just replacing all multiples of 3 by ""fizz"", all multiples of 5 by ""buzz"", and all multiples of 15 by ""fizzbuzz"
Accepts five parameters: three integers int1, int2 and limit, and two strings str1 and str2.
Returns a list of strings with numbers from 1 to limit, where: all multiples of int1 are replaced by str1, all multiples of int2 are replaced by str2, all multiples of int1 and int2 are replaced by str1str2.