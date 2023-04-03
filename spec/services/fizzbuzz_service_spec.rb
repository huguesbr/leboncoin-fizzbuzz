require "rails_helper"

describe FizzbuzzService do
  describe "#map" do
    let(:int1) { 3 }
    let(:int2) { 5 }
    let(:str1) { "fizz" }
    let(:str2) { "buzz" }
    let(:service) { described_class.new(int1: int1, int2: int2, str1: str1, str2: str2) }
    subject { service.map(i) }

    context "with a  non fizzbuzz integer" do
      let(:i) { 4 }
      it "returns the integer" do
        expect(subject).to eq(i)
      end
    end

    context "with a  fizz integer" do
      let(:i) { int1 }
      it "returns the fizz" do
        expect(subject).to eq("fizz")
      end
    end

    context "with a  buzz integer" do
      let(:i) { int2 }
      it "returns the buzz" do
        expect(subject).to eq("buzz")
      end
    end

    context "with a  fizzbuzz integer" do
      let(:i) { int1 * int2 }
      it "returns the fizzbuzz" do
        expect(subject).to eq("fizzbuzz")
      end
    end

    shared_examples "it raises AllPositiveIntegerRequiredError error" do
      it "raises AllPositiveIntegerRequiredError error" do
        expect { subject }.to raise_error described_class::AllPositiveIntegerRequiredError
      end
    end

    context "with a non positive integer" do
      let(:i) { -3 }
      it_behaves_like "it raises AllPositiveIntegerRequiredError error"
    end

    context "with a non positive int1" do
      let(:i) { 0 }
      let(:int1) { -3 }
      it_behaves_like "it raises AllPositiveIntegerRequiredError error"
    end

    context "with a non positive int2" do
      let(:i) { 0 }
      let(:int2) { -3 }
      it_behaves_like "it raises AllPositiveIntegerRequiredError error"
    end
  end
end
