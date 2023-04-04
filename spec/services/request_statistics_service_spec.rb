require "rails_helper"

describe RequestStatisticsService do
  describe "#track_request" do
    subject { described_class.new.track_request(request_method: "POST", path: "/abc", params: {blah: "blah"}) }

    it "collect statistics" do
      expect { subject }.to change { RequestEntry.count }.by(1)
      expect(RequestEntry.last.path).to eq("/abc")
      expect(RequestEntry.last.request_method).to eq("POST")
      expect(RequestEntry.last.params).to eq("blah" => "blah")
      expect(RequestEntry.last.params_hash).to eq(Digest::MD5.hexdigest('{"blah":"blah"}'))
    end
  end

  describe "#most_frequent_request" do
    subject { described_class.new.most_frequent_request }

    context "with no stats" do
      it "return nil" do
        expect(subject).to eq(nil)
      end
    end

    context "with some requests" do
      let!(:other_requests) { create_list(:request_entry, 3, path: "low", params: {a: "b"}, request_method: "GET") }
      let!(:other_requests) { create_list(:request_entry, 3, path: "top", params: {a: "c"}, request_method: "GET") }
      let!(:top_requests) { create_list(:request_entry, 4, path: "top", params: {a: "b"}, request_method: "GET") }
      let!(:other_requests) { create_list(:request_entry, 3, path: "top", params: {a: "b"}, request_method: "POST") }

      it "return the top request hit stats" do
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
