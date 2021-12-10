# frozen_string_literal: true

FactoryBot.define do
  factory :item do

    discount_type {''}

    trait :apple do
      name  { 'apple' }
      price { 10 }
    end

    trait :orange do
      name  { 'orange' }
      price { 20 }
    end

    trait :pear do
      name  { 'pear' }
      price { 15 }
    end

    trait :banana do
      name  { 'banana' }
      price { 30 }
    end

    trait :pineapple do
      name  { 'pineapple' }
      price { 100 }
    end

    trait :mango do
      name  { 'mango' }
      price { 200 }
    end

    trait :two_for_one do
      discount_type { 'TWO_FOR_ONE' }
      end

    trait :half_price do
      discount_type { 'HALF_PRICE' }
    end

    trait :half_price_restricted_to_one do
      discount_type { 'HALF_PRICE_RESTRICTED_TO_ONE' }
    end

    trait :four_for_three do
      discount_type { 'FOUR_FOR_THREE' }
    end

    initialize_with { new(name:name, price: price, discount_type: discount_type) }
  end
end
