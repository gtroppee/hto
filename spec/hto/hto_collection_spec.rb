require 'spec_helper'

describe HtoCollection do  

  before(:all) do
    @hash = { a: 1, b: { c: 3 } }
    @array = [@hash.clone, @hash.clone]
    @hto_collection = Hto.collect(@array)
  end

  it 'should delegate undefined methods to the contained Array' do
    expect(@hto_collection).to respond_to(:each)
  end
end