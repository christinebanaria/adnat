class User < ActiveRecord::Base
  has_secure_password

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }
  
  belongs_to :organisation
  has_many :shifts
end
