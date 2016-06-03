class Article < ActiveRecord::Base
  belongs_to :user
  validates :title , presence: true, length: {minimum:3, maximum: 50}  #this will ensure there's is  a title!!
  validates :description , presence: true, length: {minimum:10, maximum: 300}
  validates :user_id, presence: true
end