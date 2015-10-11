require 'spec_helper'

describe Hto do 

  before(:all) do 
    @hash = { a: 1, b: { c: 3 } }
    @array = [@hash.clone, @hash.clone]
    @hto_item = Hto.collect(@hash)
    @hto_collection = Hto.collect(@array)
  end

  it 'should handle an array of hashes by returning a HtoCollection' do
    expect(@hto_collection).to be_a(HtoCollection)
    expect(@hto_collection.first).to be_a(HtoItem)
  end

  it 'should return a new Hto when the fetched data is a hash' do
    expect(@hto_item).to be_a(HtoItem)
  end

  it 'should return a new Hto when the fetched data is not an array of hashes nor an hash' do
    # Array
    value = [1, 2, 3]
    expect(Hto.collect(value)).to eq(value)

    # Numeric
    value = 123
    expect(Hto.collect(value)).to eq(value)

    # String
    value = "123"
    expect(Hto.collect(value)).to eq(value)
  end
end