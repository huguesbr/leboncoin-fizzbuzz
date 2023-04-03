module CollectStatistic
  extend ActiveSupport::Concern
  included do
    before_action :collect_statistics

    # collect statistic on the current request
    # stored in request_entries table
    def collect_statistics
      RequestStatisticsService.new.track_request(request_method: request.method, path: request.path, params: controller_params)
    end

    private

    def controller_params
      params.to_unsafe_h.except(:controller, :action)
    end
  end
end

__END__

Collect the request statistic for the current request

TODO: allow to specify the action/method to collect the statistics for?