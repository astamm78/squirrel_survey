class Survey < ActiveRecord::Base
  mount_uploader :image, MyUploader
  
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :questions
  has_many :sessions
  has_many :users, :through => :sessions

  validates :title, :presence => :true

end
