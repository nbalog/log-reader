require_relative "../lib/reader.rb"

RSpec.describe Reader do

  let(:reader) { described_class.new("webserver.log")}

  it "has a filepath" do
    expect(reader.filepath).to eq("webserver.log")
  end

  it 'checks if found path increases the array length' do
    pages_array = reader.find_pages
    expect { pages_array.push('/some_path') }.to change { pages_array.length }.by(1)
  end
  
end
