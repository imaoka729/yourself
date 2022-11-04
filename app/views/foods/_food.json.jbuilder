json.extract! food, :id, :user_id, :food_name, :category_id, :syoumi_syouhi, :expiration_date, :purchase_date, :quantity, :created_at, :updated_at
json.url food_url(food, format: :json)
