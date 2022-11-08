class Category < ApplicationRecord

 has_many :foods

 validate :error_check
 
  def error_check
   if category_name.blank?
     errors[:base] << 'カテゴリー名は必ず入力して下さい'
   else
     categore = Category.where(user_id: @current_user.id,category_name: category_name)
     if categore
       errors[:base] << '同じ名前は一つである必要があります'
    end
   end
 end

end
