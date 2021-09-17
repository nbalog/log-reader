require_relative "../lib/printer.rb"

RSpec.describe Printer do
  
  let(:printer) { described_class.new("/path", @store)}
  
  it "has a path" do
    expect(printer.path).to eq("/path")
  end
  
  it "has a store" do
    expect(printer.store).to eq(@store)
  end
end