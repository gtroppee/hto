require 'spec_helper'

describe HtoItem do  

  before(:all) do 
    @hash1 = { a: 1, b: { c: 3 } }
    @hash2 = { 'a' => 1, 'b' => { 'c' => 3 } }
    @hto1 = Hto.collect(@hash1)
    @hto2 = Hto.collect(@hash2)
  end

  it 'should be able to fetch data through message passing' do
    expect(@hto1.a).to eq(1)
    expect(@hto2.a).to eq(1)
  end

  it 'should be able to fetch data through key with symbol' do
    expect(@hto1[:a]).to eq(1)
    expect(@hto2[:a]).to eq(1)
  end

  it 'should be able to fetch data through key with string' do
    expect(@hto1['a']).to eq(1)
    expect(@hto2['a']).to eq(1)
  end

  it 'should be able to recursively fetch data through message passing' do
    expect(@hto1.b.c).to eq(3)
    expect(@hto2.b.c).to eq(3)
  end

  it 'should be able to recursively fetch data through keys with symbol' do
    expect(@hto1[:b][:c]).to eq(3)
    expect(@hto2[:b][:c]).to eq(3)
  end

  it 'should be able to recursively fetch data through keys with string' do
    expect(@hto1['b']['c']).to eq(3)
    expect(@hto2['b']['c']).to eq(3)
  end

  it 'should be able to recursively fetch data through message passing and symbol' do
    expect(@hto1.b[:c]).to eq(3)
    expect(@hto2[:b].c).to eq(3)
  end

  it 'should be able to recursively fetch data through message passing and string' do
    expect(@hto1.b['c']).to eq(3)
    expect(@hto2['b'].c).to eq(3)
  end

  it 'should be able to recursively fetch data through keys with symbol and string' do
    expect(@hto1[:b]['c']).to eq(3)
    expect(@hto2['b'][:c]).to eq(3)
  end

  it 'should be able to convert itself back into a HashWithIndifferentAccess instance' do
    h    = @hto2.b.to_h
    hash = @hto2.b.to_hash
    expect(hash).to eq(h)
    expect(hash).to be_a(HashWithIndifferentAccess)
    expect(hash).to eq({ 'c' => 3 })
    expect(hash['c']).to eq(3)
    expect(hash[:c]).to eq(3)
  end

end