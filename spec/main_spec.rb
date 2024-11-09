require 'main'

Rspec.describe Hello do
  it 'returns Hello World' do
    result = Hello
    expect(result).to_eq("Hello World")
