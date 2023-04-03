require "rails_helper"

describe CollectStatistic, type: :controller do
  controller(ApplicationController) do
    include CollectStatistic

    def index
      head :ok
    end
  end

  describe '#collect_statistics' do
    subject { get :index, params: { blah: "blah" } }

    it "collect statistics" do
      expect { subject }.to change { RequestEntry.count }.by(1)
      expect(RequestEntry.last.path).to eq('/anonymous')
      expect(RequestEntry.last.request_method).to eq('GET')
      expect(RequestEntry.last.params).to eq("blah" => "blah")
      expect(RequestEntry.last.params_hash).to eq(Digest::MD5.hexdigest('{"blah":"blah"}'))
    end
  end
end