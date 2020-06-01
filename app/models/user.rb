class User < ApplicationRecord
  #{presence: true} ←　空の保存を防ぐ
  #{uniqueness: true}} ←　ユニークなもの
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
end
