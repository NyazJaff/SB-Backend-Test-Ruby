# frozen_string_literal: true

FactoryBot.define do
  factory :item do

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

    initialize_with { new(name:name, price: price) }
  end
end
