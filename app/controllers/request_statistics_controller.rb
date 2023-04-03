class RequestStatisticsController < ApplicationController

  def index
    render json: service.most_frequent_request || {}
  end

  private

  def service
    @service ||= RequestStatisticsService.new
  end

end

__END__

Add a statistics endpoint allowing users to know what the most frequent request has been. This endpoint should:

Accept no parameter
Return the parameters corresponding to the most used request, as well as the number of hits for this request"