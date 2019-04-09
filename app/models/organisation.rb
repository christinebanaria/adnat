class Organisation< ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :users
  validates_presence_of :name
  validates_numericality_of :hourly_rate, :message=>"Error Message"
end
