class User < ApplicationRecord

    validate :error_check

    def error_check
      if account_id.blank?
        errors[:base] << 'アカウントidは必ず入力して下さい'
      end
   
      if passward.blank?
       errors[:base] << 'パスワードは必ず入力して下さい'
      end
   
      if user_name.blank?
        errors[:base] << '利用者名は必ず入力してして下さい'
      end
    end

end
