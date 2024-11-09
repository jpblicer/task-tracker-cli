require './main'

RSpec.describe 'hello world test' do
  it 'returns Hello World' do
    expect(hello).to eq("Hello World")
  end
end
