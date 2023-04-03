class RequestStatisticsService
  # @return (Hash) the most used request (method, path, params) with number of hits
  def most_frequent_request
    most_frequent_request = RequestEntry.group(:request_method, :path, :params_hash).order(Arel.sql("count(*) desc")).limit(1).select(Arel.sql("count(*) as count, *")).first
    return nil if most_frequent_request.nil?

    {
      method: most_frequent_request.request_method,
      path: most_frequent_request.path,
      params: most_frequent_request.params,
      hits: most_frequent_request.count
    }
  end
end