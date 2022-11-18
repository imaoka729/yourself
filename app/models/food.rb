class Food < ApplicationRecord

 belongs_to :category
    
 def Food.quantity(user_id)
   foods = Food.where(user_id: user_id)
   
   total_quantity = 0
  
   foods.each do |food|
     if food.expiration_date - Date.today <= 3
        total_quantity = total_quantity + food.quantity
     end
   end
   return total_quantity
end

 validate :error_check
 validates :food_name, presence: { message: "は必ず入力して下さい" }
 validates :syoumi_syouhi, presence: { message: "は必ず選択して下さい" }
 validates :quantity, presence: { message: "は必ず入力して下さい" }
 validates :purchase_date,  date: {after_or_equal_to: Date.new(1900, 1, 1),before_or_equal_to: ->(obj) { Date.today } ,message: "は必ず今日以前にして下さい"}

 def error_check

   if !quantity.blank? && quantity < 1
     errors[:quantity] << 'は必ず１以上にしてください'
   end
  end

end
