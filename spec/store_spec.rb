require_relative "../lib/store.rb"

RSpec.describe Store do
  it "has a paths" do
    store = Store.new(paths)
    expect(store.paths).to eq(paths)
  end
end