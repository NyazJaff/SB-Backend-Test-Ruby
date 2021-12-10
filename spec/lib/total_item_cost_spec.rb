require 'spec_helper'
require 'total_item_cost'

RSpec.describe TotalItemCost do

  describe '#total' do

    let(:class_object)    { apple }
    let(:quantity)        { 1 }
    let(:total_item_cost) { described_class.new(class_object, quantity) }

    let(:apple)             { create(:item, :apple) }
    let(:two_for_one)       { create(:item, :pear, :two_for_one) }
    let(:four_for_three)    { create(:item, :mango, :four_for_three) }
    let(:half_price)        { create(:item, :banana, :half_price) }
    let(:half_price_restricted_to_one) { create(:item, :apple, :half_price_restricted_to_one) }

    subject(:total) { total_item_cost.total }

    context 'when no offers apply' do
      it 'returns the base price for the basket' do
        expect(total).to eq(10)
      end
    end

    context 'when two for one offer apply' do
      let(:class_object)    { two_for_one }
      let(:quantity)        { 3 }
      it 'returns the discounted price for the basket' do
        # each item is for 15, first two 15 and the last one an additional 15
        expect(total).to eq(30)
      end
    end

    context 'when four for three offer apply' do
      let(:class_object)    { four_for_three }
      let(:quantity)        { 5 }
      it 'returns the discounted price for the basket' do
        expect(total).to eq(800)
      end
    end

    context 'when half price offer apply' do
      let(:class_object)    { half_price }
      let(:quantity)        { 10 }
      it 'returns the discounted price for the basket' do
        expect(total).to eq(150)
      end
      end

    context 'when half price restricted to one offer apply' do
      let(:class_object)    { half_price_restricted_to_one }
      let(:quantity)        { 3 }
      it 'returns the discounted price for the basket' do
        expect(total).to eq(25)
      end
    end
  end
end

