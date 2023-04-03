require 'rails_helper'

describe RequestStatisticsService do
  describe "#most_frequent_request" do
    subject { described_class.new.most_frequent_request }

    context "with no stats" do
      it 'return nil' do
        expect(subject).to eq(nil)
      end
    end

    context "with some requests" do
      let!(:other_requests) { create_list(:request_entry, 3, path: "low", params: {a: "b"}, request_method: "GET") }
      let!(:other_requests) { create_list(:request_entry, 3, path: "top", params: {a: "c"}, request_method: "GET") }
      let!(:other_requests) { create_list(:request_entry, 3, path: "top", params: {a: "b"}, request_method: "POST") }
      let!(:top_requests) { create_list(:request_entry, 4, path: "top", params: {a: "b"}, request_method: "GET") }

      it 'return the top request hit stats' do
        expect(subject).to eq(
                             hits: 4,
                             method: "GET",
                             params: {"a" => "b"},
                             path: "top"
                           )
      end
    end
  end
end
