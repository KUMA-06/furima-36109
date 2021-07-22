FactoryBot.define do
  factory :history_buy do
    token { 'tok_13bih4b524b23' }
    price { '500' }
    postal { '123-4567' }
    area_id { 2 }
    municipality { '横浜' }
    address { '青山' }
    building { '柳ビル' }
    phone { '09012345678' }
  end
end
