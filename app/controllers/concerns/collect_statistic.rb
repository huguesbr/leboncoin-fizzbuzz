module CollectStatistic
  extend ActiveSupport::Concern
  included do
    before_action :collect_statistics

    def collect_statistics
      RequestEntry.create!(request_method: request.method, path: request.path, params: controller_params, params_hash: Digest::MD5.hexdigest(controller_params.to_json))
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