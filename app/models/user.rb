class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role, :active
  # attr_accessible :title, :body

  ROLES = %w[admin usuario]


   def self.search(search)
    
    if search
      where('name LIKE ?', "#{search}%")
    else
      scoped
    end
  end

  def active_for_authentication?
    active
  end

  def inactive_message
    "Desculpe, sua conta foi desativada."
  end

end
