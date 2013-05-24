class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :new_password
  
  has_many :surveys, :foreign_key => "author_id"
  has_many :questions, :through => :surveys
  has_many :sessions
  has_many :answers, :through => :sessions

  validates :username, :uniqueness => :true, :presence => :true
  validates :password, :length => { :minimum => 5 }

  def password
    @password ||= Password.new(self.password_hash)
  end
  
  def password=(new_password)
    if new_password.length > 5
      @password = Password.create(new_password)
      self.password_hash = @password
    else
      @password = ''
    end
  end

  def self.create(params = {})
    @user = User.new(:username => params[:username])
    @user.password = params[:password]
    @user.save
    @user
  end

  def self.authenticate(params)
    @user = User.find_by_username(params[:username])
    (@user && @user.password == params[:password]) ? @user : false
  end

end
