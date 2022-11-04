class Food < ApplicationRecord

 belongs_to :category
    
 validate :error_check

 def error_check
   if food_name.blank?
     errors[:base] << '食品名は必ず入力して下さい'
   end

   if syoumi_syouhi.blank?
    errors[:base] << '賞味・消費は必ず選択して下さい'
   end
  
   if purchase_date > Date.today
    errors[:base] << '購入日は必ず今日以前にして下さい'
   end

   if quantity.blank?
     errors[:base] << '個数は必ず入力してして下さい'
   end
 end

end
