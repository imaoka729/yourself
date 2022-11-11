class Category < ApplicationRecord

 has_many :foods

 validates :category_name, presence: { message: "は必ず入力して下さい" }
 validates :category_name, uniqueness: { scope: :user_id, message: "はすでに追加されています" }
 
end
