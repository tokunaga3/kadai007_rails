class Post < ApplicationRecord
  validates :content, presence: true
  # 空白はダメ
  validates :content, length: { minimum: 1, maximum: 140 }
  # １文字以上１４０文字以下ではないとダメ
end
