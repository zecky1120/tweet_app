class User < ApplicationRecord
  has_secure_password
  generate_public_uid # id名をランダムな乱数に変換
  #{presence: true} ←　空の保存を防ぐ
  #{uniqueness: true}} ←　ユニークなもの
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  # validates :password, {presence: true}
  # ↑has_secure_passwordをインストールしたことで自動で空の状態でも保存されないようなるためvalidatesは必要ない

  def posts
    return Post.where(user_id: self.id)
  end

  private
  def to_param
    public_uid
  end

end
