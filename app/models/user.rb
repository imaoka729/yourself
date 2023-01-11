class User < ApplicationRecord
  # 英数だけつかえるように指定　
  PASSWARD_CHECK = /\A[a-z0-9]+\z/i

    #validate :error_check
    validates :account_id, uniqueness: { case_sensitive: false, message:"は既に使用されています" } 
    validates :account_id, presence: { message: "は必ず入力して下さい" }
    validates :account_id, length: {maximum: 100, message: "は100文字以下で入力してください"}
    validates :passward, presence: { message: "は必ず入力して下さい" }
    validates :passward, format: { with: PASSWARD_CHECK, message: 'は半角英数字のみで入力してください'}
    validates :passward, length: {minimum: 4, maximum: 10, message: "は4文字以上、10文字以下で入力してください"}
    validates :user_name, presence: { message: "は必ず入力して下さい" }
    validates :user_name, length: {maximum: 100, message: "は100文字以下で入力してください"}



    def error_check        #上のvalidatesでチェック中
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
