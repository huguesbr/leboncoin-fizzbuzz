require "rails_helper"

describe "FizzbuzzController", type: :request do
  describe "#show" do
    let(:int1) { 3 }
    let(:int2) { 5 }
    let(:str1) { "fizz" }
    let(:str2) { "buzz" }
    let(:limit) { 16 }
    let(:params) { {int1: int1, int2: int2, str1: str1, str2: str2, limit: limit} }
    subject { get "/fizzbuzz", params: params }

    context "with a proper request" do
      it "return a fizzbuzz" do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq([1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz", 16])
      end
    end

    context "with a limit of 2" do
      let(:limit) { 2 }
      let(:service) { double("service") }
      before do
        allow(FizzbuzzService).to receive(:new).and_return(service)
        allow(service).to receive(:map).and_return(1)
      end

      it "instantiate the service with the proper configuration" do
        allow(FizzbuzzService).to receive(:new).with(int1: 3, int2: 5, str1: "fizz", str2: "buzz").and_return(service)
        subject
      end

      it "call the service 2 times" do
        expect(service).to receive(:map).with(1).and_return(1)
        expect(service).to receive(:map).with(2).and_return(2)
        subject
      end
    end
  end
end
