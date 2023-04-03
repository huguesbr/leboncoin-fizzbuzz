FactoryBot.define do
  factory :request_entry do
    request_method { "GET" }
    path { "/path" }
    params { {a: "b"} }
    params_hash { "12345" }
  end
end
