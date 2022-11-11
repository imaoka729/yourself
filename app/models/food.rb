class Food < ApplicationRecord

 belongs_to :category
    
 #validate :error_check
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
