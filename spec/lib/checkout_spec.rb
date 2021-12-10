require 'spec_helper'
require 'checkout'

RSpec.describe Checkout do

  describe '#total' do

    let(:checkout) { described_class.new }

    let(:apple)                       { create(:item, :apple) }
    let(:orange)                      { create(:item, :orange) }
    let(:mango_four_for_three)                       { create(:item, :mango, :four_for_three) }
    let(:apple_two_for_one)           { create(:item, :apple, :two_for_one) }
    let(:pear_two_for_one)            { create(:item, :pear, :two_for_one) }
    let(:banana_half_price)           { create(:item, :banana, :half_price) }
    let(:pineapple_half_price_restricted_to_one) { create(:item, :pineapple, :half_price_restricted_to_one) }

    subject(:total) { checkout.total }

    context 'when no offers apply' do
      before do
        checkout.scan(apple)
        checkout.scan(orange)
      end

      it 'returns the base price for the basket' do
        expect(total).to eq(30)
      end
    end

    context 'when a two for 1 applies on apples' do
      before do
        checkout.scan(apple_two_for_one)
        checkout.scan(apple_two_for_one)
        checkout.scan(apple_two_for_one)
      end

      it 'returns the discounted price for the basket' do
        expect(total).to eq(20)
      end

      context 'and there are other items' do
        before do
          checkout.scan(orange)
        end

        it 'returns the correctly discounted price for the basket' do
          expect(total).to eq(40)
        end
      end
    end

    context 'when a two for 1 applies on pears' do
      before do
        checkout.scan(pear_two_for_one)
        checkout.scan(pear_two_for_one)
      end

      it 'returns the discounted price for the basket' do
        expect(total).to eq(15)
      end

      context 'and there are other discounted items' do
        before do
          checkout.scan(banana_half_price)
        end

        it 'returns the correctly discounted price for the basket' do
          expect(total).to eq(30)
        end
      end
    end

    context 'when a half price offer applies on bananas' do
      before do
        checkout.scan(banana_half_price)
      end

      it 'returns the discounted price for the basket' do
        expect(total).to eq(15)
      end
    end

    context 'when a half price offer applies on pineapples restricted to 1 per customer' do
      before do
        checkout.scan(pineapple_half_price_restricted_to_one)
        checkout.scan(pineapple_half_price_restricted_to_one)
      end

      it 'returns the discounted price for the basket' do
        expect(total).to eq(150)
      end
    end

    context 'when a buy 3 get 1 free offer applies to mangos' do
      before do
        4.times { checkout.scan(mango_four_for_three) }
      end

      it 'returns the discounted price for the basket' do
        expect(total).to eq(600)
      end

      context 'and there are other items' do
        before do
          checkout.scan(orange)
        end

        it 'returns the correctly discounted price for the basket' do
          expect(total).to eq(620)
        end
      end

    end
  end
end
