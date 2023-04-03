class RequestStatisticsService
  # track a request
  # store the request information in db
  # @param [String] request_method method of the request (POST, ...)
  # @param [String] path of the request (/fizzbuzz)
  # @param [Hash] params of the request ({abc: 123})
  def track_request(request_method:, path:, params:)
    RequestEntry.create!(request_method: request_method, path: path, params: params, params_hash: Digest::MD5.hexdigest(params.to_json))
  end

  # @return [Hash] the most used request (method, path, params) with number of hits
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
