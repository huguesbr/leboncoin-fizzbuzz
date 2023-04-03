class RequestEntry < ApplicationRecord
  validates :request_method, inclusion: {in: %w[GET POST PUT PATCH DELETE]}
  validates :path, presence: true
  validates :params_hash, presence: true
end

__END__

Store a request

Alternately, st
