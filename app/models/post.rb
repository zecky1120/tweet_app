class Post < ApplicationRecord
  validates :title, {presence: true, length:{maximum: 50}}
  validates :content, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id) # インスタンスメソッド内でselfははそのインスタンス自身を指す
  end

end
