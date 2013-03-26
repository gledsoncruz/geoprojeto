class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  ROLES = %w[admin usuario bloqueado]


   def self.search(search)
    
    if search
      where('name LIKE ?', "#{search}%")
    else
      scoped
    end
  end

end
