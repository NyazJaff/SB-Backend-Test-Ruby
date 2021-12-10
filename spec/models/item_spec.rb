require 'spec_helper'
require_relative '../../app/models/item'

RSpec.describe Item do

  let(:name)  {'orange'}
  let(:price) { 20 }
  let(:item) { described_class.new(name: name, price: price) }

  it 'should allow accessing property types' do
    expect(item.name).to eql('orange')
    expect(item.price).to eql(20)
  end
end