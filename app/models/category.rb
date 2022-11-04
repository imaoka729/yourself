class Category < ApplicationRecord

 has_many :foods

 validate :error_check

 def error_check
   if category_name.blank?
     errors[:base] << 'カテゴリー名は必ず入力して下さい'
   end
 end

end
