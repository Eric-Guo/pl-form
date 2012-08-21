class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :badge, :email, :password, :password_confirmation, :remember_me
  validates :badge, presence: true, uniqueness: true, :length => { :minimum => 2 }
  validates :email, uniqueness: true, :allow_blank => true

  attr_accessible :shift_code, :department, :supervisor, :qa, :admin
  attr_accessible :user_recent_forms
  has_many :user_recent_forms, dependent: :destroy

protected
  def email_required?
    false
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:badge)
      where(conditions).where(["lower(badge) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
