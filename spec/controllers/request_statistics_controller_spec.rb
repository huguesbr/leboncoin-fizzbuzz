require "rails_helper"

describe RequestStatisticsController, type: :request do
  describe "#index" do
    let(:service) { double("RequestStatisticService") }

    subject { get "/request_statistics" }

    before do
      allow(RequestStatisticsService).to receive(:new).and_return(service)
      allow(service).to receive(:most_frequent_request).and_return(most_frequent_request)
    end

    context "with some stats" do
      let(:most_frequent_request) { {a: "b"} }

      it "return the most frequent request using RequestStatisticService" do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq("a" => "b")
      end
    end

    context "with no stats" do
      let(:most_frequent_request) { nil }

      it "return empty hash" do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq({})
      end
    end
  end
end
