require "rails_helper"

describe CollectStatistic, type: :controller do
  controller(ApplicationController) do
    include CollectStatistic

    def index
      head :ok
    end
  end

  describe "#collect_statistics" do
    let(:service) { double("RequestStatisticService") }
    subject { get :index, params: {blah: "blah"} }

    before do
      allow(RequestStatisticsService).to receive(:new).and_return(service)
    end

    it "call request statistic service track request" do
      expect(service).to receive(:track_request).with(request_method: "GET", path: "/anonymous", params: {blah: "blah"})
      subject
    end
  end
end
